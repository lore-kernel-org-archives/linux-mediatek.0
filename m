Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A67BC2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 23:18:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C71C2072D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 23:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tqh896Uj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QloyWelB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C71C2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8stBnMPKLzc9WCHMFvj/IVmnV0VU1ByPX2zCIH4TyGM=; b=tqh896Ujc0oDJi
	QltY35DormKqfk0H17bTJyiFJ0Ewd4/PwwMZitOW7bQFiEN9kvxC+Sx6H6z+9LfYXQFE3wQXdc8Dp
	JTc3HYFqSScsxBQD9CJLLhC8DVCLvJ43K96vfZ/qtTF2Tdaa49jWohIyX5av5vLTeh/xHwe1jFOcj
	K5zAfnFORwfnJTJo3TDZ42uD/qMPkXrFuCC30UzCPMa79nx6hsae6IXHuBZZP4kGfXkvmI9qZM00O
	Ep6sOw3MQOqXYJtM7W8fnDuxWDsTQbbtStm1l57wpUs3szdMT7B2VxRFkc92fr7+PeiBoUEnEyUO3
	5Rb1UlRaKUkj4SeRZGAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOUog-0005ro-NU; Tue, 14 Apr 2020 23:18:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOUoW-0005jV-MO; Tue, 14 Apr 2020 23:17:58 +0000
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A523D2076C;
 Tue, 14 Apr 2020 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586906274;
 bh=WdTCiKOB3OQ85f1rwfCljxgiziBMlr0YfV55qi2jrbo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QloyWelBE71CmKIbD1RCzZaIo+K8lLUrkD6Mcj0n2X9sml82jxPgaTJNuPRGm1lYJ
 wA+1NVjGQiyQFTyBGL7ZsCTywawls9BlRFoQYA86gQrC5Z+JsM3H1KL+bgbkSDG1Gm
 vxFW0veMrMjt/N/+lnmEfUz2WZBXqi6c966yLDmk=
Received: by mail-ed1-f51.google.com with SMTP id i7so1994684edq.3;
 Tue, 14 Apr 2020 16:17:54 -0700 (PDT)
X-Gm-Message-State: AGi0PuZwAQJieIzMFHhiAM5bz608Pvlly0Or+38Lw2GKkxzBc0xh6PPl
 kmbMd2xj26u3mFP+j3zOyhCrwJDHFxsV4/yzmg==
X-Google-Smtp-Source: APiQypJgoaBAyxL3iPSZCSNJxM8D8LE/eTLS0VKjjmKTYGy/LZGI8Teu7S9DiqAb6Y+rOQS+UJVF+JZSuJ74kPLs5ZE=
X-Received: by 2002:a17:906:2ad4:: with SMTP id
 m20mr2521641eje.324.1586906273069; 
 Tue, 14 Apr 2020 16:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200414030815.192104-1-hsinyi@chromium.org>
In-Reply-To: <20200414030815.192104-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 15 Apr 2020 07:17:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY__y81v6Ji5JBpmSeeh5J1kStzqEABcN7ReiM7OH5+gqtg@mail.gmail.com>
Message-ID: <CAAOTY__y81v6Ji5JBpmSeeh5J1kStzqEABcN7ReiM7OH5+gqtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mt8173: fix mdp aliases property name
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_161756_772461_CE482C4D 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWkKCkhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4g5pa8IDIwMjDl
ubQ05pyIMTTml6Ug6YCx5LqMIOS4iuWNiDExOjA45a+r6YGT77yaCj4KPiBGaXggd2FybmluZzoK
PiBXYXJuaW5nIChhbGlhc19wYXRocyk6IC9hbGlhc2VzOiBhbGlhc2VzIHByb3BlcnR5IG5hbWUg
bXVzdCBpbmNsdWRlIG9ubHkgbG93ZXJjYXNlIGFuZCAnLScKClJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBIc2lu
LVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kKPiBpbmRleCBhMjEyYmYxMjRlODEuLmQxZTljNDEw
MDRiNCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5k
dHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaQo+IEBA
IC00MiwxNCArNDIsMTQgQEAgYWxpYXNlcyB7Cj4gICAgICAgICAgICAgICAgIGRwaTAgPSAmZHBp
MDsKPiAgICAgICAgICAgICAgICAgZHNpMCA9ICZkc2kwOwo+ICAgICAgICAgICAgICAgICBkc2kx
ID0gJmRzaTE7Cj4gLSAgICAgICAgICAgICAgIG1kcF9yZG1hMCA9ICZtZHBfcmRtYTA7Cj4gLSAg
ICAgICAgICAgICAgIG1kcF9yZG1hMSA9ICZtZHBfcmRtYTE7Cj4gLSAgICAgICAgICAgICAgIG1k
cF9yc3owID0gJm1kcF9yc3owOwo+IC0gICAgICAgICAgICAgICBtZHBfcnN6MSA9ICZtZHBfcnN6
MTsKPiAtICAgICAgICAgICAgICAgbWRwX3JzejIgPSAmbWRwX3JzejI7Cj4gLSAgICAgICAgICAg
ICAgIG1kcF93ZG1hMCA9ICZtZHBfd2RtYTA7Cj4gLSAgICAgICAgICAgICAgIG1kcF93cm90MCA9
ICZtZHBfd3JvdDA7Cj4gLSAgICAgICAgICAgICAgIG1kcF93cm90MSA9ICZtZHBfd3JvdDE7Cj4g
KyAgICAgICAgICAgICAgIG1kcC1yZG1hMCA9ICZtZHBfcmRtYTA7Cj4gKyAgICAgICAgICAgICAg
IG1kcC1yZG1hMSA9ICZtZHBfcmRtYTE7Cj4gKyAgICAgICAgICAgICAgIG1kcC1yc3owID0gJm1k
cF9yc3owOwo+ICsgICAgICAgICAgICAgICBtZHAtcnN6MSA9ICZtZHBfcnN6MTsKPiArICAgICAg
ICAgICAgICAgbWRwLXJzejIgPSAmbWRwX3JzejI7Cj4gKyAgICAgICAgICAgICAgIG1kcC13ZG1h
MCA9ICZtZHBfd2RtYTA7Cj4gKyAgICAgICAgICAgICAgIG1kcC13cm90MCA9ICZtZHBfd3JvdDA7
Cj4gKyAgICAgICAgICAgICAgIG1kcC13cm90MSA9ICZtZHBfd3JvdDE7Cj4gICAgICAgICAgICAg
ICAgIHNlcmlhbDAgPSAmdWFydDA7Cj4gICAgICAgICAgICAgICAgIHNlcmlhbDEgPSAmdWFydDE7
Cj4gICAgICAgICAgICAgICAgIHNlcmlhbDIgPSAmdWFydDI7Cj4gLS0KPiAyLjI2LjAuMTEwLmcy
MTgzYmFmMDljLWdvb2cKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
