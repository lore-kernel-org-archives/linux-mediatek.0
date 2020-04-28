Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8296C83000
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 11:17:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B73B206E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 11:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YJHusFK7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nbd.name header.i=@nbd.name header.b="h+vklNke"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B73B206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwOPwJBR/kOGGLox1odnECdTX2F7hCT0QFtAfrr7qMA=; b=YJHusFK7md2m2X
	X0nIk9n39EWPUApdvgpb151PJNgFCPDE5ALesyIEDy2rtgGymAJt4GI9/DCnFutyh//d2AfGPTXiW
	nKfTNFd6ZnYSBYoYdMh/ae4dddqCiF0EJAeYH09prOT5u+edJQTWvhOHzAN7G4F1EZo1ZX6eXbPCa
	QY0gkyvcJlVEKTB8dGPye8LstwZxmmRSLwnuHgdBEN/ggW5gct20m23PTDGfUXlUfLB2SABBe2kp4
	14LGUbdcohswVa2tBrivVZbkfqK192avOfhaeWmz7/329OjbsgnKsQCDf6R0nIiDXCldntNU23cGa
	BsEWO8xXFlNFvgzKrEog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTOEc-00036i-10; Tue, 28 Apr 2020 11:17:06 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTOEZ-00034d-5M
 for linux-mediatek@lists.infradead.org; Tue, 28 Apr 2020 11:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XOhDfptpwh2eyxeLvzb+d+hOxPoOaH2iB/kxQVxTMjU=; b=h+vklNke7tDARomiV32fLLXcqE
 c0ikX46g+ToZh/daC5uxCo39tXdxw1Fl330bhsYG3eIpPh0xDE0V8OGsqd0LSrDYIGaognX3uJ+VN
 DZhCEt0KL7nZTigZr0lqIRObH10ZuGkluowmTkMkc6NYF8dlsOckmVfJ4PbukrMZSrDA=;
Received: from [80.255.7.108] (helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1jTOET-0000qa-RX; Tue, 28 Apr 2020 13:16:57 +0200
Subject: Re: [PATCH] mt76: mt7663: add the possibility to load firmware v2
To: Kalle Valo <kvalo@codeaurora.org>, Lorenzo Bianconi <lorenzo@kernel.org>
References: <db72b648024aba3243ee3b7deceb548c9bc2bdf1.1587911939.git.lorenzo@kernel.org>
 <87ftcnj2be.fsf@tynnyri.adurom.net>
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; prefer-encrypt=mutual; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCfTKx80VvCR/PvsUlrvdOLsIgeRGAAn1ee
 RjMaxwtSdaCKMw3j33ZbsWS4
Message-ID: <fd49291e-173e-20b0-ee67-c4f519ce8419@nbd.name>
Date: Tue, 28 Apr 2020 13:16:56 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87ftcnj2be.fsf@tynnyri.adurom.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_041703_397942_D927F176 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-04-28 13:07, Kalle Valo wrote:
> Lorenzo Bianconi <lorenzo@kernel.org> writes:
> 
>> mt7663 firmware v2 is used for embedded devices since it has more completed
>> features in AP mode.
>> Add the capability to specify in mt7615 Kconfig which firmware load first
>> (v3 or v2) and fallback to the other one if the selected firmware fails
>> to load
>>
>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> ---
>>  .../net/wireless/mediatek/mt76/mt7615/Kconfig | 13 +++++
>>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 50 ++++++++++++++++---
>>  .../wireless/mediatek/mt76/mt7615/mt7615.h    |  6 ++-
>>  .../net/wireless/mediatek/mt76/mt7615/pci.c   |  2 +
>>  .../net/wireless/mediatek/mt76/mt7615/usb.c   |  2 +
>>  5 files changed, 65 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
>> index e25db1135eda..c04d6a182bf0 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
>> @@ -38,3 +38,16 @@ config MT7663U
>>  	  This adds support for MT7663U 802.11ax 2x2:2 wireless devices.
>>  
>>  	  To compile this driver as a module, choose M here.
>> +
>> +config MT7615_OFFLOAD_FIRMWARE
>> +	bool "Prefer client mode offload firmware (MT7663)"
>> +	depends on MT7615E || MT7663U
>> +	default y
>> +	help
>> +	  Load MT7663 client mode offload firmware (v3) as primary option
>> +	  and fallback to MT7663 firmware v2 in case of failure.
>> +	  If MT7615_OFFLOAD_FIRMWARE is not selected MT7663 firmware v2
>> +	  will be used as primary option.
>> +	  MT7663 client mode offload firmware supports low power features
>> +	  (hw frequency scanning, scheduled frequency scanning, WoW,
>> +	  802.11 power save) but is more limited in AP mode
> 
> Why does this need a compile time config? Wouldn't some kind of runtime
> configuration be better?
I don't think supporting runtime configuration is worth the extra
complexity of adding an API for shutting down and restarting the
firmware and dealing with potential errors along the way.

Both firmware types support AP and client mode. Which one you use
depends on the kind of system you're building for.

If you're building an embedded AP, you don't need any low power offloads
and may want to support more than 32 clients, so you'd disable this
configuration option.

If you run the driver on a laptop or desktop machine, you will most
likely stick to the default.

If you want to switch without recompiling, you can always just delete
the set of firmware files you don't want to use. The driver will fall
back to the other type.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
