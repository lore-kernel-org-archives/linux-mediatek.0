Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8D7C4708D
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:57:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70F8E610A8
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70F8E610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WAXtQbae++8mnfNVmiXWYA7B2fBsiw6NJva/RtaJ6mM=; b=xTr4j87JESjKWlQjmku+RbrZQf
	u95s9EHlCo713TRX9MP1TdW7YA2EFiG/XlrXudh6odaP8MzQ4dLcZtH9rWx8YZtKL/uZgnuUxTnaV
	CRTYQ102dkMBsEU97zWo3etHySnM+6gcCTuTUsiYl6fWoYAWjGRfjwor31zFj+buVOMTbLTesG5fq
	Y0r3FKK8HigPExx6UGSmjy52DTm+IpJofqlP5PDJjwKEMXcAhu82XFLIpP3UsRHbm2GLnVHocFXEC
	noJv6ncETqDTT4yKLg6X7AZ+ljHrG5b7rq0K6xdH2NOYWdskH5el0RV9ikgJF6vpbRNFTj/6tWGEp
	uTUle9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYIe-00DcW9-4D; Fri, 28 May 2021 08:57:00 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYIP-00DcPg-2v
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 08:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SpSfsBsII+1PKcjb/5Zuio6S2J479RKFh2z8FdE5ebI=; b=Ew/PJBygVPiHSXendy1ZGj+/Sk
 XMRQpyBY3XBLrPBFP8i05QGUQ9XsDcceeaCcwDeBm2fIh3PfrPKOEaUjJ5X0Vb2XkCD2XcUwaBvzR
 QEoCPR6Xib9fvyK9BqM97Rg4nxhbQESc9LTl8cc1AsBwQb26ORPuHEZJ1cCsrFxdssCM=;
Received: from p54ae9ff2.dip0.t-ipconnect.de ([84.174.159.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lmYIJ-0003fd-5F; Fri, 28 May 2021 10:56:39 +0200
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20210504125225.2536-1-shayne.chen@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: mt7915: add debugfs knob to read efuse value from FW
Message-ID: <32908981-c864-aa13-b182-8081610baa9c@nbd.name>
Date: Fri, 28 May 2021 10:56:38 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210504125225.2536-1-shayne.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_015645_460585_6DC11668 
X-CRM114-Status: UNSURE (   7.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2021-05-04 14:52, Shayne Chen wrote:
> In efuse mode, mt7915 only reads efuse values from FW which driver need.
> Add a debugfs knob to read addtional efuse values from a specific field,
> which is useful in some cases such as checking if rf values in efuse
> are properly burned.
> 
> An example of usage:
> echo 0x400 > efuse_idx
> hexdump -C eeprom
> 
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
I'd prefer if we read the entire efuse and put it in a "otp" debugfs
file, like on older chips.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
