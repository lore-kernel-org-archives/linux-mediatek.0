Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F76CC369B2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 12:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpIHE//hKP8VhrsONThnQAnp41zdFJC48uql62litoE=; b=ndXCnwEH5a9dJA9fOFmdWU2FQ7
	DdMvVOCAflwsv7HMNmtHWF7ARzqvXRu1Hs0vbzEW8zdNyrjZ6gaBzXySw86WmYVbJAO6qoq+hRtxq
	c6qu4bclAqhlv3WrXi/VFTvkaoU8aHxl2ZBAERLayFjKgzX4VzZbrSSnPsv74Eq4ir/A0t0LnItpX
	xFvpqCCRc273d+YzJLpLF2HDp6++rWEX6g4lpgAdwWA0bytU0Z7/jVARFCZgDQ8yJeLNg0LGUyU/H
	0E/oYJfJ2vEUvYi7Jwo6b7wyd1YFcz9k02KNIwnS/D8pALFHinH2FonYpzhDhjrReBogbCfGMLmtj
	sohQ5I9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JB8-00000001zmN-0pb3;
	Mon, 14 Apr 2025 12:44:46 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J6j-00000001z7R-3EIR
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Apr 2025 12:40:16 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6e8fc176825so35062906d6.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Apr 2025 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744634412; x=1745239212; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rpIHE//hKP8VhrsONThnQAnp41zdFJC48uql62litoE=;
        b=LZADyltjyUjxJYUShcPKZcrQqeqDAC/NH7ncUfKohCCMPJC/qqksXUbHD9C0ov5Zik
         NkT2AKZ0RLfj7+JfLFKc/8jdDhjXDBVneiLpiMJnDR5RIzfwpJQh6uk/gSWi5xn3OdDG
         m6CU6zduJm1fWDU9/D77aDHrPXx/YwN6f6t6oN8n6zguv9Du4z9LAs4ZpVeAMrA+jEWF
         23QaXso2QLBsUl/vu+A4lKSU3sCmc7L6/H06kYnjIPdZH1Hed3m9AQNLSH+Fjw+xOQ0H
         cswR7lEDim530pCbTavRExIwY0OQGLUjVH73+4FUx3tDWeDz14SDp4IrXsbwAQ1MgcYc
         2nvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634412; x=1745239212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpIHE//hKP8VhrsONThnQAnp41zdFJC48uql62litoE=;
        b=PMHlIWr4xGRt2xQQVm8WR+V1aCumK+GgYPZ84WJWTF0BY+ndyrHVeXv7Z7G6OQ903w
         Wza1AW+nwpXYTv7F0ECHEaaO1oguPwDZly39wadcwSFGDssB0EnOzMPsHFKogcX/B44d
         gd1O4q/GfF0zZ4UZ3gtyJ+oIwlvS9jzmAd28Md0mh7/nPsbunm++h2GrH1UAOwyqYpF/
         NZVFVfPKiJPASLdsAlbX49LaNwoHhIF0jIrnXLeHxmTLFOITg9IwKVWh0/JgabOdCgd/
         e1s5YLW8oBHj7RMmERdRjp4KQ/DKMmeReP9gM6h3h9iAo/uuvHYy83cUNUn750O6XCRb
         sYNg==
X-Forwarded-Encrypted: i=1; AJvYcCVEDyP3/ilE0SyEmkDBXS0fEIKx926aeaTtXMA6/9r9TgEi8ta6fDy3qSMRwDwXhbq5eC7xrdMnsFGixipoIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyX902sxgnKA7daSunf1j3OdCP66CTGP9gYih/pU3N5c8n6gaig
	0saiMCaqM5NAQm69+1KhKki1WTR7d+RbOZkNwpa50pkCLjPddpbCz3VEtmj4S+w=
X-Gm-Gg: ASbGnctcrnW0ykNB0xqxcUkMjftLoEscU1gOYhAWXUrmB0adhV2f6xTifHtxapGlDNX
	3AKSZ8No/yZgWo3Lviu1iPqWUgbF7oPlDNyNk5OSlTzAutxRTUakZtArzoioDnovaqUedRWO9oP
	j5E9d9Kd1yqKis+tU4vRfs1wrX2etXwbd9u00FwwIgOkUdeQvfZxpH9o2FduhA1uggx0E00lxpd
	aOntL2jc7lRdlO/s3sBylahnUh9bcz5NigJMbMThpa/khTK49kzO/mg7PNvAyF35BTVMHuBfQWW
	m6gtxUDoohfGkILJIcUnii/WoLa4rgkLFxxdRX8FU1wEqw==
X-Google-Smtp-Source: AGHT+IEkbFkFwojQpGraee89v+X8dSxjfxKK65sER14n9Mv9RQD0FEdieKFkmsXCfg907A7TCfC9Lw==
X-Received: by 2002:ad4:5763:0:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-6f23f180df4mr213244336d6.31.1744634411886;
        Mon, 14 Apr 2025 05:40:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea08007sm82522326d6.86.2025.04.14.05.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:40:11 -0700 (PDT)
Message-ID: <a43b8d8f51577fdf579f1bd602eadfdafcd21c08.camel@ndufresne.ca>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles
 for MT8188 MDP3
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, 	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, 	sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
Date: Mon, 14 Apr 2025 08:40:09 -0400
In-Reply-To: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
	 <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_054013_893367_1273C319 
X-CRM114-Status: GOOD (  11.52  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGUgbWVyY3JlZGkgMTggZMOpY2VtYnJlIDIwMjQgw6AgMTE6NTMgKzAxMDAsIEFuZ2Vsb0dpb2Fj
Y2hpbm8gRGVsIFJlZ25vIGEgw6ljcml0wqA6Cj4gQWRkIGNvbXBhdGlibGUgc3RyaW5ncyBmb3Ig
dGhlIEFBTCwgQ09MT1IsIE1FUkdFIGFuZCBQQURESU5HCj4gaGFyZHdhcmUgY29tcG9uZW50cyBm
b3VuZCBpbiBNZWRpYVRlaydzIE1UODE4OCBTb0MuCj4gCj4gVGhpcyBoYXJkd2FyZSBpcyBjb21w
YXRpYmxlIHdpdGggTVQ4MTk1Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgpBY2tl
ZC1ieTogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPgoK
PiAtLS0KPiDCoC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGFhbC55YW1s
wqDCoMKgwqDCoMKgwqAgfMKgIDQgKysrKwo+IMKgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssY29sb3IueWFtbMKgwqDCoMKgwqAgfMKgIDQgKysrKwo+IMKgLi4uL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbMKgwqDCoMKgwqAgfMKgIDQg
KysrKwo+IMKgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55
YW1swqDCoMKgIHwgMTAgKysrKysrKy0tLQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxhYWwueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGFhbC55YW1sCj4gaW5kZXggY2YyNDQzNDg1NGZmLi4xNDc5MDM1ZGE0MDkgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssYWFsLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxhYWwueWFtbAo+IEBAIC0yNSw2ICsyNSwxMCBAQCBw
cm9wZXJ0aWVzOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTczLWRpc3At
YWFsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxODMtZGlzcC1hYWwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE5NS1tZHAzLWFhbAo+ICvCoMKgwqDC
oMKgIC0gaXRlbXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTg4LW1kcDMtYWFsCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1hYWwKPiDCoMKgwqDCoMKgwqAg
LSBpdGVtczoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10MjcxMi1kaXNwLWFhbAo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxjb2xvci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssY29sb3IueWFtbAo+IGluZGV4IDdkZjc4NmJiYWQyMC4uNzk5YzBi
OGZjMWY5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGNvbG9yLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxjb2xvci55YW1s
Cj4gQEAgLTI3LDYgKzI3LDEwIEBAIHByb3BlcnRpZXM6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBtZWRpYXRlayxtdDgxNjctZGlzcC1jb2xvcgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVk
aWF0ZWssbXQ4MTczLWRpc3AtY29sb3IKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVr
LG10ODE5NS1tZHAzLWNvbG9yCj4gK8KgwqDCoMKgwqAgLSBpdGVtczoKPiArwqDCoMKgwqDCoMKg
wqDCoMKgIC0gZW51bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayxt
dDgxODgtbWRwMy1jb2xvcgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogbWVkaWF0ZWss
bXQ4MTk1LW1kcDMtY29sb3IKPiDCoMKgwqDCoMKgwqAgLSBpdGVtczoKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIGVudW06Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVr
LG10NzYyMy1kaXNwLWNvbG9yCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJn
ZS55YW1sCj4gaW5kZXggZGFlODM5Mjc5OTUwLi40MTVhMjViYzE4ZmEgMTAwNjQ0Cj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssbWVyZ2UueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwKPiBAQCAtMjUsNiArMjUsMTAgQEAg
cHJvcGVydGllczoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE3My1kaXNw
LW1lcmdlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxOTUtZGlzcC1tZXJn
ZQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTk1LW1kcDMtbWVyZ2UKPiAr
wqDCoMKgwqDCoCAtIGl0ZW1zOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE4OC1tZHAzLW1lcmdlCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1tZXJnZQo+IMKg
wqDCoMKgwqDCoCAtIGl0ZW1zOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IG1lZGlh
dGVrLG10Njc5NS1kaXNwLW1lcmdlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogbWVk
aWF0ZWssbXQ4MTczLWRpc3AtbWVyZ2UKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWsscGFkZGluZy55YW1sCj4gaW5kZXggYmUwN2JiZGM1NGUzLi44Njc4Nzg2NmNlZDAgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sCj4gQEAgLTIw
LDkgKzIwLDEzIEBAIGRlc2NyaXB0aW9uOgo+IMKgCj4gwqBwcm9wZXJ0aWVzOgo+IMKgwqAgY29t
cGF0aWJsZToKPiAtwqDCoMKgIGVudW06Cj4gLcKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxODgt
ZGlzcC1wYWRkaW5nCj4gLcKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxOTUtbWRwMy1wYWRkaW5n
Cj4gK8KgwqDCoCBvbmVPZjoKPiArwqDCoMKgwqDCoCAtIGVudW06Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoCAtIG1lZGlhdGVrLG10ODE4OC1kaXNwLXBhZGRpbmcKPiArwqDCoMKgwqDCoMKgwqDCoMKg
IC0gbWVkaWF0ZWssbXQ4MTk1LW1kcDMtcGFkZGluZwo+ICvCoMKgwqDCoMKgIC0gaXRlbXM6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODgtbWRwMy1wYWRkaW5n
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1wYWRk
aW5nCj4gwqAKPiDCoMKgIHJlZzoKPiDCoMKgwqDCoCBtYXhJdGVtczogMQo=


