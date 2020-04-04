Return-Path: <SRS0=WnB0=5U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F56C2BA16
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 14:07:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54330206D4
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 14:07:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WNnBavsO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWy7vm3L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54330206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3WmUAK8UsxMdpPw808QcmI8Bf5b91UR3hnLkSElolE=; b=WNnBavsOsJcc51
	DQiSAdJg5indBOOAOrA9m/HgPVtnquq36dsETqQpRpV3WbqtHdOdLvzoecec43uvGzbPsgUmXwrVO
	8iFwzNc+hZ6YalW6Si9KdmvxIIKGd+miKk2cPLrM2Hnx6BHx7S7qo9jUWI26pappLvPSQLrnWnvLf
	pDXoh2dP7kqBQHU94ARdP2zfbYI3aOX/Zb3LdJD6inM86fgpoI4JuQ83bCZNjXupU1Tge1Wb1fA7X
	7fDe944bbUQBezd54/aZZ6MTCJ2UYYbHsseZnIdBZUlYW2zSi7DzXUhooTjKTI9Rfi8UPTm62yPN6
	ISJkKu2Hiu/UNE9+DeJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKjRw-0002U2-Q1; Sat, 04 Apr 2020 14:07:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKjRo-0002MC-5z; Sat, 04 Apr 2020 14:06:57 +0000
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A450206E9;
 Sat,  4 Apr 2020 14:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586009215;
 bh=+b0oTb1t16JA3+0YlDERGnAPMV5kIMdS/LTGfcOX41U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iWy7vm3LoJ4gIkCEL0zaUEPwgdnMfzqTIEcyrq2vZw4QErpiYkYIf8TPVd3/vvhO+
 VDAAv9Iaht+eJ+vaZl58hwvlR0MFm+MgpMdQuoYGn8CXwYnbeQL4Nzkcx5jYNvcVV8
 ioSnllioTBsfwPbdkwMKfqYl7pyi7+Ouf0qGUQ3s=
Received: by mail-ed1-f47.google.com with SMTP id w26so12863265edu.7;
 Sat, 04 Apr 2020 07:06:55 -0700 (PDT)
X-Gm-Message-State: AGi0Pua2OgY3WgAOYKXgchj198TxagGY4PKEgWdK5ljiwrUr51ZyRfWZ
 u02GG63AFNoWfIPEnzrIQsmxhBHyg01QWr31ww==
X-Google-Smtp-Source: APiQypKLXINGBOt97ZZpI29BPDjcTt7cZyRUT5zbCMljkyv5Paew8tAP2fOKpbz9k7takTeCmHk4vVxNJHxo+pWOLBU=
X-Received: by 2002:a05:6402:b70:: with SMTP id
 cb16mr11854658edb.48.1586009214144; 
 Sat, 04 Apr 2020 07:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200403080350.95826-1-jitao.shi@mediatek.com>
 <20200403080350.95826-2-jitao.shi@mediatek.com>
In-Reply-To: <20200403080350.95826-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 4 Apr 2020 22:06:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-0xddwEvo+v8KsyfSVbtYpe_cZGLFoz-5BBnx5MEwHEQ@mail.gmail.com>
Message-ID: <CAAOTY_-0xddwEvo+v8KsyfSVbtYpe_cZGLFoz-5BBnx5MEwHEQ@mail.gmail.com>
Subject: Re: [PATCH v14 1/3] dt-bindings: display: mediatek: control dpi pins
 mode to avoid leakage
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_070656_261634_A66C8569 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDTmnIgz5pelIOmAseS6lCDkuIvljYg0OjA05a+r6YGT77yaCj4KPiBBZGQgcHJvcGVydHkgInBp
bmN0cmwtbmFtZXMiIHRvIHN3YXAgcGluIG1vZGUgYmV0d2VlbiBncGlvIGFuZCBkcGkgbW9kZS4g
U2V0Cj4gdGhlIGRwaSBwaW5zIHRvIGdwaW8gbW9kZSBhbmQgb3V0cHV0LWxvdyB0byBhdm9pZCBs
ZWFrYWdlIGN1cnJlbnQgd2hlbiBkcGkKPiBkaXNhYmxlZC4KPgoKUmV2aWV3ZWQtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPiBTaWduZWQtb2ZmLWJ5OiBKaXRh
byBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnR4dCAgIHwgNiArKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkcGkudHh0Cj4gaW5kZXggNTg5MTRjZjY4MWI4Li43N2RlZjQ0NTY3MDYgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssZHBpLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50eHQKPiBAQCAtMTcsNiArMTcsOSBA
QCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncmFwaC50eHQuIFRoaXMgcG9ydCBzaG91bGQgYmUgY29ubmVjdGVkCj4gICAgdG8gdGhl
IGlucHV0IHBvcnQgb2YgYW4gYXR0YWNoZWQgSERNSSBvciBMVkRTIGVuY29kZXIgY2hpcC4KPgo+
ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICstIHBpbmN0cmwtbmFtZXM6IENvbnRhaW4gImRlZmF1
bHQiIGFuZCAic2xlZXAiLgo+ICsKPiAgRXhhbXBsZToKPgo+ICBkcGkwOiBkcGlAMTQwMWQwMDAg
ewo+IEBAIC0yNyw2ICszMCw5IEBAIGRwaTA6IGRwaUAxNDAxZDAwMCB7Cj4gICAgICAgICAgICAg
ICAgICA8Jm1tc3lzIENMS19NTV9EUElfRU5HSU5FPiwKPiAgICAgICAgICAgICAgICAgIDwmYXBt
aXhlZHN5cyBDTEtfQVBNSVhFRF9UVkRQTEw+Owo+ICAgICAgICAgY2xvY2stbmFtZXMgPSAicGl4
ZWwiLCAiZW5naW5lIiwgInBsbCI7Cj4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
LCAic2xlZXAiOwo+ICsgICAgICAgcGluY3RybC0wID0gPCZkcGlfcGluX2Z1bmM+Owo+ICsgICAg
ICAgcGluY3RybC0xID0gPCZkcGlfcGluX2lkbGU+Owo+Cj4gICAgICAgICBwb3J0IHsKPiAgICAg
ICAgICAgICAgICAgZHBpMF9vdXQ6IGVuZHBvaW50IHsKPiAtLQo+IDIuMjEuMAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
