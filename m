Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB2CC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 13:59:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2448B206A2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 13:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tMX2COKD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="JybrStuP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2448B206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:Subject:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S/ezwruWIcitwQW3rsuyPYPWK5PIvVToWTiStzkjrnM=; b=tMX2COKDN54gS1XyILbRYwcTv4
	V2Ai1dUMzIprJWoErSFBjX98Z2H4b/nsVx1kz8BXAAg5DSJP1ISkyt5Ju8cxAGzloY61HkM0GYDu6
	yq7a3ZqHaMIdyI2cJG6Rq0gHnqHPdSJMhe6K/fgJqiZrtvkpnJm6vyhUIEOAIvPz3KxsInYyQeTwv
	fr4aUTtDNpTn7qhHaOaQqzSs7+VOPEFymxBr+TLx54xYler4oBHUf5xVL2wUxbUGPKVXuQrz6tx/Y
	skaLbrQDZPnSPp6MJW1kbQ0j9/IlnLZ/MvbQddMO5yqz9l4SiIcSH8z7BYIWGOpTA1ZEJ7BHOHi8U
	y6J/MN6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG0cq-0007ki-29; Wed, 09 Sep 2020 13:59:04 +0000
Received: from mout.web.de ([212.227.15.14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDPM8-0002Uj-H7; Wed, 02 Sep 2020 09:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1599040021;
 bh=O2M8ToO4yWnPUjBz+knGxpfOXcWoN3Q6P+CYviDDNKU=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=JybrStuPW1pA8iFaH3Q5/n21IMNEr6eWZ58cpyhhLrzwn62Uig/TK0L7EfZF/C7Vr
 d5d87AuDfeLYCgZM0uRktCVRki6Jbm92qH3WB1YdcvJYiJXEgD/j9ahIipEHJwIDoB
 C5Z4qpvwkXWzZxSQIg8R+VG7Vf/MgIuvPx5zVPo8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.24.57]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MD8VY-1kNI68369E-00GXr5; Wed, 02
 Sep 2020 11:33:36 +0200
To: Nicolas Boichat <drinkcat@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] rpmsg: Avoid double-free in mtk_rpmsg_register_device()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9f4fb922-4aa3-0b63-6d81-c83daefd13b9@web.de>
Date: Wed, 2 Sep 2020 11:33:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:Z7keicrgZ/SvG3cDMF5P9zuUzYh3zeu8uw644ar6m5N8y3Z91FM
 6CcWi8Q7xvMtanj/aKswLtXA6D6B8TAnyAS4L8VdxHOkHxoI6s/tXOoA7qFCqgyt5Zc7aLR
 Mc6GkQRcw+Lc5p45Sz7Xc/dsqZIeA6QGNQqlCQapy1NXyVNc4nPeWkbx6iq6fiueD/NcqPe
 nv3yG+RNIMcYbv+NigvSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NOW7zoWOH4Q=:WqVYtYb7QEJ7Ym5Q0Lt904
 rMaUgKpZnFiguFGqDRcM1fIiutPcY8gQC6yJfWUrSQwK6+RLfpqNevc8qGqIix5aOZPg0/Iwa
 3rHAeBgviwMlUaguyd5dLnaaFPP9zWiwKGjwNI/kyzJFeLFHkH1PomkW8LDerVmLGXfqJ/0Mm
 BlP0rEU+8E8uMBv+fqCWGqf31VRTWucDf1k3QMtjBkHnaSzHA9WsAlh85LQroEuDGG6kMaPmL
 rOPlpKUqNL89VeFpRuVh5dJCYaA7We4WTH07D+8pxdypa5HTCjAFA0dEIVQA6NEW1+Icalcyo
 xa1dYtSIRPCV/j+QyvH/eXLiILtWNI0uRcfsQuhxyjdU4ng64yVIDOro0ML2VO7j3HpFo/leP
 WJGB+Xbcj5aSNS4fqGG9dZf70RvI4Msy/nvaOZA6v2tMXwfGtmYvxZydJAKCHnIW1MyM08mxj
 Z70+yObnwk9v/Bm8OkPccgVvqs50hCY5HGfPgsSwohjrCVE202Juekv7voZGit9ikUKbEzawA
 EUeuuLgrqEuLKZf9B6FzUiEbypjRdJ59ryYVmYRrmCsqxpi3O/OtIXItHWk/mj0khDZLinRe5
 6p19Oq+YNsL1kfXBYOdZ//4UBlG6a8rhR11nIXuFGlnbPyE1ITl5Eg4ix+SFTdfckUmtVVMO0
 G77kfRhD9OJrt38ccAPyovo/WR4pYPuA8ylKopEOl98UkDA1ayJ0Sl9+qSMf1YZx7K3rivHmM
 4nO+YQXIMjQqTcJlPs5DHEVh31p8o69lLGlQ7Fog9dKqbI7C0a4O9+KqlUfE2ewKhFCWR9cbO
 vhMDeyZXrNN1z0dKWFb84Bl8CTaDlzaG3JGh2rnr8/dsuQahpTA+0XcLPBueBVJau0eDrOHOC
 sHCfMZ8lKQUb9DDjU0Ui352GghrcxUXVk5vkzi6V59t0cfaapVZ5DHBaRYIIVP4i113fPCvZ2
 9y5R52fUJBWb9N2MyG1tfjjdri9qa6wQx8JX0XvCCFQ/Rgv2g/foumMZfBLSr+myveXotAeyY
 /h89PQ+IDQZuk8HDdhRQRkier+CW4dyNx81LZOytTr02mkC01uojyTA3X9zY2xEItTFWyZuG1
 oxS8qjlk/jhvNoL7y30tuQ7Ty7YvTOM3eWwP8iWuliXgQTax0N9DxS1mjGTUbt6DmvoarLzoI
 PzaLDs0Eg1ddhy53UVoqE30FybP5AnWcftkrgZj5jNgzqRL2uN3uxIrmyHBP/pTF3WUViGiKE
 rvjvato3NF5QjhFYH5gqZttofQTocXzH9xcvCWQ==
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_054704_802526_03C5C462 
X-CRM114-Status: GOOD (  12.67  )
X-Mailman-Approved-At: Wed, 09 Sep 2020 09:59:02 -0400
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiBJZiBycG1zZ19yZWdpc3Rlcl9kZXZpY2UgZmFpbHMsIGl0IHdpbGwgY2FsbAo+IG10a19ycG1z
Z19yZWxlYXNlX2RldmljZSB3aGljaCBhbHJlYWR5IGZyZWVzIG1kZXYuCgpDYW4gYW5vdGhlciBp
bXBlcmF0aXZlIHdvcmRpbmcgYmVjb21lIGhlbHBmdWwgZm9yIHRoZSBjaGFuZ2UgZGVzY3JpcHRp
b24/Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZh
bGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNo
ZXMucnN0P2lkPTljN2Q2MTliZTVhMDAyZWEyOWMxNzJkZjVlM2MxMjI3YzIyY2JiNDEjbjE1MQoK
CuKApgo+ICsrKyBiL2RyaXZlcnMvcnBtc2cvbXRrX3JwbXNnLmMKPiBAQCAtMjIwLDEwICsyMjAs
OCBAQCAgc3RhdGljIGludCBtdGtfcnBtc2dfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBtdGtfcnBt
c2dfcnByb2Nfc3ViZGV2ICptdGtfc3ViZGV2LAo+ICAJcnBkZXYtPmRldi5yZWxlYXNlID0gbXRr
X3JwbXNnX3JlbGVhc2VfZGV2aWNlOwo+Cj4gIAlyZXQgPSBycG1zZ19yZWdpc3Rlcl9kZXZpY2Uo
cnBkZXYpOwo+IC0JaWYgKHJldCkgewo+IC0JCWtmcmVlKG1kZXYpOwo+ICsJaWYgKHJldCkKPiAg
CQlyZXR1cm4gcmV0Owo+IC0JfQo+Cj4gIAlyZXR1cm4gMDsKPiAgfQoKCiogSG93IGRvIHlvdSB0
aGluayBhYm91dCB0byB1c2UgdGhlIGZvbGxvd2luZyBjb2RlIHZhcmlhbnQgaW5zdGVhZD8KCgly
ZXR1cm4gcnBtc2dfcmVnaXN0ZXJfZGV2aWNlKHJwZGV2KTsKCiogV291bGQgeW91IGxpa2UgdG8g
b21pdCB0aGUgdmFyaWFibGUg4oCccmV04oCdIGZvciB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0
aW9uPwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
