Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13870C83000
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 11:39:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D93CD206D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 11:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L7z8OM+r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="qGsUzZy+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D93CD206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2JyUsGmOm9rbi58wc7hO2g/4Qe03G/Zc99sFs7L86w=; b=L7z8OM+rVBwd6+
	BlK2nfC1oixRUf2bk7JE5+ApSzDou++rOAVl6GJtBFw9lJ5B9mHVL5V11ByD8p0mDAwwWti+CzpW/
	zwS1+kORrk2/t9T61QorC/KoEYmxBoTVX723A9EEXHRwiR7LRDFYmFFqjuR/tOetwD1qAsnoDdQAJ
	LsnEyPielJXaP9w61roScD36BOBiMArue6a32tqvUVjVzXT9rwG1huhdlqaQaSukL+1MpL1eXwvTE
	FavA2SUtFmSOXMfovVZH2zx0nwpkMgSg+wZhdPCVAiPj8VmWbT+0R4PdfJolppqEm5YP30bHo1U+d
	e092lKVJFRm2e4HPSKBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTOa3-0001J7-EC; Tue, 28 Apr 2020 11:39:15 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTOZw-0001IB-TR
 for linux-mediatek@lists.infradead.org; Tue, 28 Apr 2020 11:39:14 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588073952; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=a8/TpkMVFPqNezmywV/i3J7uCyQ73bxSaPegLhAQg5I=;
 b=qGsUzZy+ISCkg6ibxXxZXlC6RGzFJfCXyoF38QvqsysvTdoCUsmGT8c8kwI2uGjvnhvI4eg6
 CSTZNatMEl7egT+AP1cdkRaiJ0BMFaw7n468jpVi3Lu1P58FUUr8m/ZKxwUalN5LcoqtetL8
 qFOcJOM0AcMkMKJdzxFavWOflLM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea815cf.7f54e6f77d50-smtp-out-n02;
 Tue, 28 Apr 2020 11:38:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8A5CDC433F2; Tue, 28 Apr 2020 11:38:55 +0000 (UTC)
Received: from x230.qca.qualcomm.com (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CA15C433CB;
 Tue, 28 Apr 2020 11:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4CA15C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: mt7663: add the possibility to load firmware v2
References: <db72b648024aba3243ee3b7deceb548c9bc2bdf1.1587911939.git.lorenzo@kernel.org>
 <87ftcnj2be.fsf@tynnyri.adurom.net>
 <fd49291e-173e-20b0-ee67-c4f519ce8419@nbd.name>
Date: Tue, 28 Apr 2020 14:38:51 +0300
In-Reply-To: <fd49291e-173e-20b0-ee67-c4f519ce8419@nbd.name> (Felix Fietkau's
 message of "Tue, 28 Apr 2020 13:16:56 +0200")
Message-ID: <87k11zlu0k.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_043912_192902_5B6ACE48 
X-CRM114-Status: GOOD (  22.78  )
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
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Felix Fietkau <nbd@nbd.name> writes:

> On 2020-04-28 13:07, Kalle Valo wrote:
>> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>> 
>>> mt7663 firmware v2 is used for embedded devices since it has more completed
>>> features in AP mode.
>>> Add the capability to specify in mt7615 Kconfig which firmware load first
>>> (v3 or v2) and fallback to the other one if the selected firmware fails
>>> to load
>>>
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>> ---
>>>  .../net/wireless/mediatek/mt76/mt7615/Kconfig | 13 +++++
>>>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 50 ++++++++++++++++---
>>>  .../wireless/mediatek/mt76/mt7615/mt7615.h    |  6 ++-
>>>  .../net/wireless/mediatek/mt76/mt7615/pci.c   |  2 +
>>>  .../net/wireless/mediatek/mt76/mt7615/usb.c   |  2 +
>>>  5 files changed, 65 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
>>> index e25db1135eda..c04d6a182bf0 100644
>>> --- a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
>>> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
>>> @@ -38,3 +38,16 @@ config MT7663U
>>>  	  This adds support for MT7663U 802.11ax 2x2:2 wireless devices.
>>>  
>>>  	  To compile this driver as a module, choose M here.
>>> +
>>> +config MT7615_OFFLOAD_FIRMWARE
>>> +	bool "Prefer client mode offload firmware (MT7663)"
>>> +	depends on MT7615E || MT7663U
>>> +	default y
>>> +	help
>>> +	  Load MT7663 client mode offload firmware (v3) as primary option
>>> +	  and fallback to MT7663 firmware v2 in case of failure.
>>> +	  If MT7615_OFFLOAD_FIRMWARE is not selected MT7663 firmware v2
>>> +	  will be used as primary option.
>>> +	  MT7663 client mode offload firmware supports low power features
>>> +	  (hw frequency scanning, scheduled frequency scanning, WoW,
>>> +	  802.11 power save) but is more limited in AP mode
>> 
>> Why does this need a compile time config? Wouldn't some kind of runtime
>> configuration be better?
>
> I don't think supporting runtime configuration is worth the extra
> complexity of adding an API for shutting down and restarting the
> firmware and dealing with potential errors along the way.
>
> Both firmware types support AP and client mode. Which one you use
> depends on the kind of system you're building for.
>
> If you're building an embedded AP, you don't need any low power offloads
> and may want to support more than 32 clients, so you'd disable this
> configuration option.
>
> If you run the driver on a laptop or desktop machine, you will most
> likely stick to the default.

Yeah, the need for this kind of "firmware settings" interface comes up
frequently, for example to provide settings to the firmware before it's
loaded or choosing which firmware image to load. It would be great to
find a generic solution for that. IIRC someone suggested devlink at some
point but no idea if that would help here.

> If you want to switch without recompiling, you can always just delete
> the set of firmware files you don't want to use. The driver will fall
> back to the other type.

My problem here is the new Kconfig option and the way I see is that this
feature doesn't justify the need of a new Kconfig option. A Kconfig
option shouldn't change the driver behaviour, it should be more about
enabling and disabling components and other compilation specific
configuration.

What about a module parameter? That would be much better and at least I
can't think of a technical reason why it wouldn't work.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
