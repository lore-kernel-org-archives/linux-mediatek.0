Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF99C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 13:11:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F9D0208DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 13:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qgh4/ohr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBT/TEIo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F9D0208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=borZuym3/2Oz7RdI/3m7nLVin4On7o0sR0uRMDvv99A=; b=qgh4/ohr9bf8POWP3FJQyh9Ua
	ImuLxzlofHAcSUMomLQJNHD2j/7TY/MFSsRGnIBBWnHVtLUpSprOrBHdxhIYxyn/JazJLFjunZsCV
	QBbcdxjWYyJC+i1kiA0DW3x3JvpUrN4Uf8H0M+VcJP6aXJE7EDiMeaanldQxBllRcEAGwwi1KIzaa
	IyLtF1iEXWFEj5XNDeSgaxtSwgETVbBXzNp87LZ/D2ahIdSm0PguLr/tytC8/td6KmrQ9jN1cY3Sk
	onJsEXoH6Bx5wYfUk9hIMm8n0phOzJOT4An8mGIcO04PBircGUC5MNGVm51Xbc12hk/fY1BdnJQvh
	BWo1UFaLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHoGX-0005Az-OW; Mon, 14 Sep 2020 13:11:29 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHoGS-00058n-6G
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 13:11:27 +0000
Received: by mail-wr1-x443.google.com with SMTP id o5so18623460wrn.13
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9w3sxxj8pSXMWFjqFI11OsxhpoFFNgS3AccbtAl9K1M=;
 b=lBT/TEIoVFDPRE5LwTVY/VpAg2giTJNs4JR7ctTfRE1fCQmUZXODK+A2klNxsJhbwR
 m9NC+xn8xfAqF4J5rMCWADG08i1mY7wpdcnPMLMKEBuTVZF4dAzSMkG40HYKngprFpSs
 fDBHbBw4eiddbMeHOZX9207boj7dTc0D5ErsiWBslRM7+JMaFOxmksFe/phZI072dX29
 2pZZLE1jUyORQkqa6pEfBwjtA2xpfN6ouZqbgA3S9VJlbrcyBvW/YZVLwWcDc0YWZaV9
 vo8Ox5rSwCDom5JJX69nSnfMH6vNRGWGUheLbCbnyESqoz/rOOyuKmg4xZ4sPULfrWNI
 ALVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9w3sxxj8pSXMWFjqFI11OsxhpoFFNgS3AccbtAl9K1M=;
 b=mxerU5kp7t2IuePxOR5cgueH3qgDolJiVwLIhVlVPdiyQCWQIeFxN8PKLx3JhumI1Z
 d6M0MozQp1GyS/jLcx7pDh3eBnjAljBg0ZABkGzGxQdByp8zzaSrRMWLQyukr8tfgQlY
 +8dgwC12pUgvVIS2CXfbY+1xesLY6RDvYx9t34XbL9DCvmXTBRzUakDL0hUdmDvJqE2W
 v7vIYn3F6lrIi8jXBw48LJcibCxxg+tSt01lQxi8RHOgLgC136sgBg6XfRlugMT+8biA
 CWXUwqiAGAolybrhkXc8RL8tYHzTIAZBxaL4iil/GgH5M6BRs/gWWsR2l8tL7bv4OXAp
 f/jQ==
X-Gm-Message-State: AOAM531inGSaYCUvTUo3IyeX98eBs2DyEUctNVU0Cx5i7MGY5NxM7GKP
 IobhOLghMzjebUstdjLWBTM=
X-Google-Smtp-Source: ABdhPJzSLIDDoxmjCP7UlhRP0PsUbCmacVeAoUB2b/QALbpC2eIxxdOx01zPUhBWyQo8GwEN91CDPA==
X-Received: by 2002:a05:6000:11cd:: with SMTP id
 i13mr15276243wrx.140.1600089083213; 
 Mon, 14 Sep 2020 06:11:23 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id i16sm20417229wrq.73.2020.09.14.06.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 06:11:22 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
Date: Mon, 14 Sep 2020 15:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009141208200.17999@felia>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_091124_526501_A86439D0 
X-CRM114-Status: GOOD (  24.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/09/2020 12:20, Lukas Bulwahn wrote:
> 
> 
> On Mon, 14 Sep 2020, Matthias Brugger wrote:
> 
>>
>>
>> On 14/09/2020 07:31, Lukas Bulwahn wrote:
>>> Commit 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller
>>> support") does not mention that linux-mediatek@lists.infradead.org is
>>> moderated for non-subscribers, but the other eight entries for
>>> linux-mediatek@lists.infradead.org do.
>>>
>>> Adjust this entry to be consistent with all others.
>>>
>>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>>
>> Maybe rephrase the commit message to something like:
>> "Mark linux-mediatek@lists.infraded.org as moderated for the MediaTek PCIe
>> host controller entry, as the list actually is moderated."
>>
>> Anyway:
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>
>>> ---
>>> applies cleanly on v5.9-rc5 and next-20200911
>>>
>>> Ryder, please ack.
>>>
>>> Bjorn, Matthias, please pick this minor non-urgent clean-up patch.
>>>
>>> This patch submission will also show me if linux-mediatek is moderated or
>>> not. I have not subscribed to linux-mediatek and if it shows up quickly in
>>> the archive, the list is probably not moderated; and if it takes longer, it
>>> is moderated, and hence, validating the patch.
>>
>> I can affirm the list is moderated :)
>>
> 
> Hmm, do we mean the same "moderation" here?
> 
> I believe a mailing list with the remark "moderated for non-subscribers"
> means that a mail from an address that has not subscribed to the mailing
> list is put on hold and needs to be manually permitted to be seen on the
> mailing list.
> 
> Matthias, is that also your understanding of "moderated for
> non-subscribers" for your Reviewed-by tag?

Yes.

> 
> I am not subscribed to linux-mediatek. When I sent an email to the list,
> it showed up really seconds later in the lore.kernel.org of the
> linux-mediatek public-inbox repository. So, either it was delivered
> quickly as it is not moderated or my check with lore.kernel.org is wrong,
> e.g., mails show up in the lore.kernel.org archive, even they were not
> yet permitted on the actual list.
> 

I'm the moderator and I get requests to moderate emails. I suppose I added you 
to the accepted list because of earlier emails you send.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
