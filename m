Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA68C4167E
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 10:13:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4504760E90
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 10:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4504760E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=systemli.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWS/N6ygnrWCUcW2Cs6Yd3CuG7aQ3p8RX4EHFKOBUqg=; b=tTdofHVp1VZwZH
	os69FUIWEWpDDSIgu0CGUwTlXZmzvb4aldH79UExBO/1MNTzatI8s0pFSdq+TwtLcDDipKULKcQU0
	S+E+oCMMj9R1TuYY0xe1JBOJbgc9UzhS2r/8TYeCXJNqTtMz3xXltDCuyorAfZENyCaM3uDNwEFDp
	KBYWPkbgXJ2MKYeArKeTZ6YzLbPPGduStNlBLcauYCAthOhJNUokzZzYEbE1y/waICloppHRCc5t7
	Jf4ftl5Y0rWbgxR7s9neMOEph3lpIAWmzxV0Xct4RPTKhUHVRB7uax7aQGdcZBKqpUb9q7scwy+jw
	3SUvnVMpDN/+OPJU7OEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcPeE-00Evav-9W; Mon, 18 Oct 2021 10:13:38 +0000
Received: from mail1.systemli.org ([2a00:c38:11e:ffff::a032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcPe0-00EvTg-Ny; Mon, 18 Oct 2021 10:13:26 +0000
Message-ID: <f2a5f060-3c25-d22a-3ff5-7c42609df2df@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1634552002;
 bh=9HajkE2qXMxojvnWjEhkynLVQ1MGIixSXKuaxH/TlW4=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=YHmRYOQECm9hi5WaVIyfUX2FMMyGdxPzPsU9bbEMGPSozT1dlzGe/XWLWPBN2ms0v
 ClXbeRviVdXLzaz/WJIu+Mk2z3A78COCG8NQ/j6TKF1qMGYHF2S4PfHS9moFuRwULT
 siOWnwZqR/ekjvfu/FNYIjeHdt9EdZqb+Ode3rKLmZ90ZrRX9dHsOJv8W2YK6y7UiZ
 8AVUfM7Gp80Ygm+GJHTgFTHsAiz0dkk30NycsGjeVs0Lkc9kDxE8s0VFIU3APRtcGS
 ORx0sm1XxU9eAKaPpiCFDj/JlzQDzp30vtt6fNCAj2vMACHstg8yIROrPPc8v+dbmo
 1WsOn8s0fIpGA==
Date: Mon, 18 Oct 2021 12:13:19 +0200
MIME-Version: 1.0
Subject: Re: [RFC v2] mt76: mt7615: mt7622: fix ibss and meshpoint
Content-Language: en-US
From: Nick <vincent@systemli.org>
To: Daniel Golle <daniel@makrotopia.org>,
 Frank Wunderlich <frank-w@public-files.de>
Cc: Kalle Valo <kvalo@codeaurora.org>, nbd@nbd.name,
 lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, sean.wang@mediatek.com,
 shayne.chen@mediatek.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>
References: <20211007225725.2615-1-vincent@systemli.org>
 <87czoe61kh.fsf@codeaurora.org>
 <274013cd-29e4-9202-423b-bd2b2222d6b8@systemli.org>
 <YWGXiExg1uBIFr2c@makrotopia.org>
 <trinity-b64203a5-8e23-4d1c-afd1-a29afa69f8f6-1634473696601@3c-app-gmx-bs33>
 <YWwqlk6rGbEp1obc@makrotopia.org>
 <716d8b51-5a4e-e074-aa1a-4d2055cf18cf@systemli.org>
In-Reply-To: <716d8b51-5a4e-e074-aa1a-4d2055cf18cf@systemli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_031324_967626_36FCD43A 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sorry, I should have added, that the simultanously mode was not working 
on the mt7622 with and without patch. With mt7615e it was working.

Bests
Nick

On 10/18/21 12:11, Nick wrote:
> On 10/17/21 15:52, Daniel Golle wrote:
>
>> Independently of each other or simultanously?
>
> My tests were done simultanously. The "plus" means to the same time 
> with my post. However, simultanously AP and AdHoc was never be 
> possible with the patch, nor without the patch.
>
> Bests
> Nick
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
