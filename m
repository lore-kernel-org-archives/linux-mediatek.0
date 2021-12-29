Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44727C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 19:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBQsrwWmRHCEitXTF0FdZNNocP0CIn3WE5y8KOGcCOg=; b=p2ahpustt3Cwii
	geT0KBdEqU9zUXnyfnngTz2Kup7vzZJ/AMcoiU5Fza+uLwVCsfmtutYz78w9xDZcVoheFbZn72P8y
	8RGzS4wJWMa947PbLSI2nnTfAV0cTGcFQMnDHMy2TDGzJMeNomXyLY6UbN7BOaK9glhIShu0P6dQy
	N+r+cGUVMqUCiUUVB60vS2SEUu8mFuwh4tFf8Kbt3YpLQY3ekPa4hvJ77ymhRFTN7Wn7reZ6vuWCe
	nEVJpxJg2CVzW1QQq39AYuUpqJIu5o1kWgp7DmKOJ5jBEH1V2Nn17aWjAtwG01/qRRFwSSmpIxQOD
	puis4DnfHHgA0sx7F2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2f2S-003N7e-FT; Wed, 29 Dec 2021 19:55:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2f2F-003N4J-5X; Wed, 29 Dec 2021 19:54:56 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so12279676wmb.0; 
 Wed, 29 Dec 2021 11:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NrUwacVRFzf7fPecApv7ayzGGTUNhRqhhOB3jeB+l2U=;
 b=YsSoIPwzO9KKLygwNBShfBEoExsIkKA/yPYAt7L9NGQRNHoAAVh7WJzs9nItMNfGHL
 770ifnXVhVaXC2stW2OilxKe7hOOM8jArF7uWzS6j81GZvy2zyaLq439wUj3TMHSaGPy
 /x0OzentsBshc35MCbf3+VcYzAw7YUdFwz+gMiL9FbQO2p5kQp+MHTdWVym772MoyEon
 457sRW07z+hJMgncCqnEa0R0Pkixt7E3ciZxbd3A10WRFq1Ov/uu1HBJMHPY7Qq5d6Kp
 SViY9YG/QCQ27PV0hXmIKoY6fANq5/OiZKer4MJVSfVlak+gCf2hbPTgj4rghgPj0N1Q
 KG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NrUwacVRFzf7fPecApv7ayzGGTUNhRqhhOB3jeB+l2U=;
 b=D3eTRgCJBTIiTZ19PWvtpXS/uXxsgBjSy3mDkVaDgH/2YSSA408fWJYY1UtJAgH9f7
 0U2fIVmL+wRhepzbyt7uEGhJYCENwhqi2KlplHSyblNGilwyTqC2xnvuSBqyn4HqWyVG
 8/9MsQ8L2Ku2Sd7TCMfeRi4H3kaJlmgErGYjmP4C6vozqdd+MljMeVzRxanVa+afoDoF
 4J9YOeD+pd4LHLEb048xEgSbvidkazfzWuq7dHt5jHimA9TS5D1oZnC34Ia+k29ow4US
 91Krywvbr70r1SVGEDRIMcaC5Sr54sxjiW4lnSTzfxvSyfmpNJoMxvy6t79VWjoiBeyN
 mWxg==
X-Gm-Message-State: AOAM530xh2U0IL/oJ3Y52QwzTUe6cjw6EjzSE+Bi7QGWJy0c4bojTPvi
 EghIKOkjtdKTdlsNikoqaEI=
X-Google-Smtp-Source: ABdhPJwicjRzPYXLZuwWJqBlXY6XpJaAGofQW7h4VyW/OcTIkX81w4DFb+roiVs0KmVLtQdpqcwhRA==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr22777579wmb.73.1640807693669; 
 Wed, 29 Dec 2021 11:54:53 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id d10sm24046243wri.57.2021.12.29.11.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 11:54:53 -0800 (PST)
Message-ID: <af4243f6-a4cd-a51e-0ee0-d5f0dec074ff@gmail.com>
Date: Wed, 29 Dec 2021 20:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] arm64: defconfig: Enable cpufreq for MediaTek
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20211217154452.868419-1-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211217154452.868419-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_115455_245642_15E67D99 
X-CRM114-Status: GOOD (  14.58  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxNy8xMi8yMDIxIDE2OjQ0LCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90ZToKPiBU
aGUgTWVkaWFUZWsgQ1BVRnJlcSBkcml2ZXIgcHJvdmlkZXMgY29udHJvbCBvZiBDUFUgZnJlcXVl
bmN5L3ZvbHRhZ2UKPiBvbiBNZWRpYVRlayBTb0NzLiBTaW5jZSB0aGVyZSdzIG5vIGRldmljZS10
cmVlIG5vZGUgdG8gYmluZCBpdCB0bywgdGhlCj4gZHJpdmVyIG5lZWRzIHRvIGJlIGVuYWJsZWQg
YnVpbHQtaW4uIEVuYWJsZSBpdCBzby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBS
LiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpRdWV1ZWQgbm93IGluIHY1LjE2
LXRtcC9kZWZjb25maWcKClRoYW5rcwoKPiAtLS0KPiAgIGFyY2gvYXJtNjQvY29uZmlncy9kZWZj
b25maWcgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9hcm02NC9jb25maWdz
L2RlZmNvbmZpZwo+IGluZGV4IGYyZTJiOWJkZDcwMi4uODI5ZThiYzA0NWY3IDEwMDY0NAo+IC0t
LSBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKPiArKysgYi9hcmNoL2FybTY0L2NvbmZp
Z3MvZGVmY29uZmlnCj4gQEAgLTk2LDYgKzk2LDcgQEAgQ09ORklHX0FSTV9RQ09NX0NQVUZSRVFf
SFc9eQo+ICAgQ09ORklHX0FSTV9SQVNQQkVSUllQSV9DUFVGUkVRPW0KPiAgIENPTkZJR19BUk1f
U0NNSV9DUFVGUkVRPXkKPiAgIENPTkZJR19BUk1fVEVHUkExODZfQ1BVRlJFUT15Cj4gK0NPTkZJ
R19BUk1fTUVESUFURUtfQ1BVRlJFUT15Cj4gICBDT05GSUdfUU9SSVFfQ1BVRlJFUT15Cj4gICBD
T05GSUdfQVJNX1NDTUlfUFJPVE9DT0w9eQo+ICAgQ09ORklHX0FSTV9TQ1BJX1BST1RPQ09MPXkK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
