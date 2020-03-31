Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC3CC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:25:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E34B20CC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 16:25:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fbiQCwRB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Legx0+Xa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0AIOsd7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E34B20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LS7H0TTJjCfBrfM2VUqww87FNmZC0dXx4lnAyhOBB5o=; b=fbiQCwRBG9FcU9
	x4TvlgGYw/oRdCiyrEeqGq+25tVLVLuxOD2TD2PLKrQfLDmvWzI23aEQj6ju3LhQQTY9YlPymI1Yx
	nRzf1oIK+uNBGRJ1ZmeXBSh4CfEVAAULTxfKvNx0P6yNsaXsujKR4YaTXdPLxnIw3lOS6aQc3JQw5
	IiSkyJm3WEoM1CNrNYY6w3NpjipvruEeQS4O9/cnFh6COQmh/pgvbK2BQ6X8+SmzpERRmJbu3fSxT
	hWIroEIY9e7KtL2mUNebxpPEEcv12QNtG9GNcO+l88+qXML6LOpqntokn2PTzN7kiQUmMSPmGGCAY
	vuezeh+OMnME4TemEuwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJhI-0003uN-3l; Tue, 31 Mar 2020 16:25:04 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJhG-0003Y5-Nz
 for linux-mediatek@bombadil.infradead.org; Tue, 31 Mar 2020 16:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=LYJQtMRkgSd+78FfcAxPcF+aCr4UeK5hP0LJ9oRCLxA=; b=Legx0+XaYgE9C4pnLovrIIKVpy
 tfOpWNjbDaObx+02v0jThCpQwH6WrD2HHSHVTnQog1qGKCdMsh+njX18dw/TFgo1KSIz2P4Xd+8Kv
 gx8dS2nNza4RxhHiPcijaeBOvOlPD0D9sveWEApM/Ad7nW4P5dXMWR27egRPy+bveQNa22OesReb3
 Ho1TXKNxV9SlRAVLbAFUDqbDkSW5uEd7dhuHXrHBb0YfnThusrIyIrmhIwOFqJOJWdI4AOxXIhtMB
 9E76nq5eB5zrVpb+dAApb+ljU+NDdXLxekP59RV4yvRNvBJS+0xQE9p7ex73zIFDJWon+7MpBigfm
 Ye0Xv0+w==;
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJGW2-0001Nr-Li
 for linux-mediatek@lists.infradead.org; Tue, 31 Mar 2020 13:01:16 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62FB221473
 for <linux-mediatek@lists.infradead.org>; Tue, 31 Mar 2020 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585659672;
 bh=Nfl47u1xeUXnlgIrfnkPwm3bagj8NSOXldMy+Hhzr9U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X0AIOsd7Ku5rH7Viok3BWEgppCqjy1GotNuHRAwUI1Dyv5ZVPM1j7dYTppECIsjY6
 ZXRwvnwzU93+AM630g/qZBS29+wf+LnELs7b4/3FrcKOe4q5Xrm5NZ+ahlY3KebpUJ
 LvZWi8+bLVz7KISdL9DP3IZtGV8TAjLIvEWN/w7s=
Received: by mail-ed1-f42.google.com with SMTP id a20so25053848edj.2
 for <linux-mediatek@lists.infradead.org>; Tue, 31 Mar 2020 06:01:12 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1aCpxr58mJRVDMgZ6obhniYV9ua2a/phkAcF8pAw4F9tgxNg2g
 2St0vJNeUQhauc3/a5PK8Sf6Se8WdEEzGd4Dmg==
X-Google-Smtp-Source: ADFU+vtG0HzoHGEJZdc4SeIl3MerLvRzg5Qp69UHJ0ZuDqDUN2AbQDJIziXDYXzOE0H28L1yL+HwWbiBMAHeVls5qjQ=
X-Received: by 2002:a17:906:4bc3:: with SMTP id
 x3mr3719882ejv.38.1585659670641; 
 Tue, 31 Mar 2020 06:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200330141222.17529-1-chunkuang.hu@kernel.org>
 <20200330141222.17529-4-chunkuang.hu@kernel.org>
 <b1c22917-76b4-2de9-3f0a-0d7736dae94f@baylibre.com>
In-Reply-To: <b1c22917-76b4-2de9-3f0a-0d7736dae94f@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 31 Mar 2020 21:00:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_88=yo1P9F-hEbpsOjqPpRCLnE71fT+Jgts8ifxaH1xGw@mail.gmail.com>
Message-ID: <CAAOTY_88=yo1P9F-hEbpsOjqPpRCLnE71fT+Jgts8ifxaH1xGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/mediatek: Move mtk_hdmi_phy driver into
 drivers/phy/mediatek folder
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5laWw6CgpOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAy
MDIw5bm0M+aciDMx5pelIOmAseS6jCDkuIvljYg0OjA15a+r6YGT77yaCj4KPiBIaSwKPgo+IE9u
IDMwLzAzLzIwMjAgMTY6MTIsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiBGcm9tOiBDSyBIdSA8
Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4KPiA+IG10a19oZG1pX3BoeSBpcyBjdXJyZW50bHkgcGxh
Y2VkIGluc2lkZSBtZWRpYXRlayBkcm0gZHJpdmVyLCBidXQgaXQncwo+ID4gbW9yZSBzdWl0YWJs
ZSB0byBwbGFjZSBhIHBoeSBkcml2ZXIgaW50byBwaHkgZHJpdmVyIGZvbGRlciwgc28gbW92ZQo+
ID4gbXRrX2hkbWlfcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLgo+Cj4gUHJldHR5
IHN1cmUgdGhlIHN1YmplY3Qgc2hvdWxkIHN0YXJ0IHdpdGggInBoeTogIiBhbmQgaGF2ZSBhbiBh
Y2sgZnJvbSBLaXNob24uCgpJIHdvdWxkIG1vZGlmeSB0aGUgc3ViamVjdCBpbiBuZXh0IHZlcnNp
b24gYW5kIHdhaXQgZm9yIEtpc2hvbidzIGFjay4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4g
TmVpbAo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDcgLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2IC0tLS0tLQo+ID4gIGRyaXZl
cnMvcGh5L21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA3
ICsrKysrKysKPiA+ICBkcml2ZXJzL3BoeS9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNyArKysrKysrCj4gPiAgLi4uL21lZGlhdGVrL3BoeS1tdGstaGRt
aS1tdDI3MDEuY30gICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ICAuLi4vbWVkaWF0
ZWsvcGh5LW10ay1oZG1pLW10ODE3My5jfSAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+
ID4gIC4uLi9tdGtfaGRtaV9waHkuYyA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLmN9ICAg
ICAgICAgfCAyICstCj4gPiAgLi4uL210a19oZG1pX3BoeS5oID0+IHBoeS9tZWRpYXRlay9waHkt
bXRrLWhkbWkuaH0gICAgICAgICB8IDAKPiA+ICA4IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ID4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJtL21lZGlh
dGVrL210a19tdDI3MDFfaGRtaV9waHkuYyA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10
MjcwMS5jfSAoOTklKQo+ID4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19t
dDgxNzNfaGRtaV9waHkuYyA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10ODE3My5jfSAo
OTklKQo+ID4gIHJlbmFtZSBkcml2ZXJzL3tncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3BoeS5j
ID0+IHBoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuY30gKDk5JSkKPiA+ICByZW5hbWUgZHJpdmVy
cy97Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHkuaCA9PiBwaHkvbWVkaWF0ZWsvcGh5LW10
ay1oZG1pLmh9ICgxMDAlKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnCj4gPiBpbmRl
eCBmZjZhMWViNGFlODMuLjI0MjdkNWJmNjk5ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
S2NvbmZpZwo+ID4gQEAgLTI2LDEwICsyNiwzIEBAIGNvbmZpZyBEUk1fTUVESUFURUtfSERNSQo+
ID4gICAgICAgc2VsZWN0IFBIWV9NVEtfSERNSQo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBE
Uk0vS01TIEhETUkgZHJpdmVyIGZvciBNZWRpYXRlayBTb0NzCj4gPiAtCj4gPiAtY29uZmlnIFBI
WV9NVEtfSERNSQo+ID4gLSAgICB0cmlzdGF0ZSAiTWVkaWFUZWsgSERNSS1QSFkgRHJpdmVyIgo+
ID4gLSAgICBkZXBlbmRzIG9uIEFSQ0hfTUVESUFURUsgJiYgT0YKPiA+IC0gICAgc2VsZWN0IEdF
TkVSSUNfUEhZCj4gPiAtICAgIGhlbHAKPiA+IC0gICAgICAgICAgRW5hYmxlIHRoaXMgdG8gc3Vw
cG9ydCBIRE1JLVBIWQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9N
YWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQo+ID4gaW5kZXggZmNi
ZWYyM2FhNmNlLi43N2IwZmQ4NjA2M2QgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvTWFrZWZpbGUKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtl
ZmlsZQo+ID4gQEAgLTIyLDkgKzIyLDMgQEAgbWVkaWF0ZWstZHJtLWhkbWktb2JqcyA6PSBtdGtf
Y2VjLm8gXAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbXRrX2hkbWlfZGRjLm8KPiA+Cj4g
PiAgb2JqLSQoQ09ORklHX0RSTV9NRURJQVRFS19IRE1JKSArPSBtZWRpYXRlay1kcm0taGRtaS5v
Cj4gPiAtCj4gPiAtcGh5LW10ay1oZG1pLWRydi1vYmpzIDo9IG10a19oZG1pX3BoeS5vIFwKPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgbXRrX210MjcwMV9oZG1pX3BoeS5vIFwKPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgbXRrX210ODE3M19oZG1pX3BoeS5vCj4gPiAtCj4gPiAtb2JqLSQo
Q09ORklHX1BIWV9NVEtfSERNSSkgKz0gcGh5LW10ay1oZG1pLWRydi5vCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9waHkvbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL0tj
b25maWcKPiA+IGluZGV4IGRlZTc1N2M5NTdmMi4uMTBmMGVjMmQ1YjU0IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9waHkvbWVkaWF0ZWsvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9waHkvbWVk
aWF0ZWsvS2NvbmZpZwo+ID4gQEAgLTM1LDMgKzM1LDEwIEBAIGNvbmZpZyBQSFlfTVRLX1hTUEhZ
Cj4gPiAgICAgICAgIEVuYWJsZSB0aGlzIHRvIHN1cHBvcnQgdGhlIFN1cGVyU3BlZWRQbHVzIFhT
LVBIWSB0cmFuc2NlaXZlciBmb3IKPiA+ICAgICAgICAgVVNCMy4xIEdFTjIgY29udHJvbGxlcnMg
b24gTWVkaWFUZWsgY2hpcHMuIFRoZSBkcml2ZXIgc3VwcG9ydHMKPiA+ICAgICAgICAgbXVsdGlw
bGUgVVNCMi4wLCBVU0IzLjEgR0VOMiBwb3J0cy4KPiA+ICsKPiA+ICtjb25maWcgUEhZX01US19I
RE1JCj4gPiArICAgIHRyaXN0YXRlICJNZWRpYVRlayBIRE1JLVBIWSBEcml2ZXIiCj4gPiArICAg
IGRlcGVuZHMgb24gQVJDSF9NRURJQVRFSyAmJiBPRgo+ID4gKyAgICBzZWxlY3QgR0VORVJJQ19Q
SFkKPiA+ICsgICAgaGVscAo+ID4gKyAgICAgICAgICBFbmFibGUgdGhpcyB0byBzdXBwb3J0IEhE
TUktUEhZCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvbWVkaWF0ZWsvTWFrZWZpbGUgYi9k
cml2ZXJzL3BoeS9tZWRpYXRlay9NYWtlZmlsZQo+ID4gaW5kZXggMDhhOGU2YTk3YjFlLi5jZGEw
NzRjNTMyMzUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3BoeS9tZWRpYXRlay9NYWtlZmlsZQo+
ID4gKysrIGIvZHJpdmVycy9waHkvbWVkaWF0ZWsvTWFrZWZpbGUKPiA+IEBAIC02LDMgKzYsMTAg
QEAKPiA+ICBvYmotJChDT05GSUdfUEhZX01US19UUEhZKSAgICAgICAgICAgKz0gcGh5LW10ay10
cGh5Lm8KPiA+ICBvYmotJChDT05GSUdfUEhZX01US19VRlMpICAgICAgICAgICAgKz0gcGh5LW10
ay11ZnMubwo+ID4gIG9iai0kKENPTkZJR19QSFlfTVRLX1hTUEhZKSAgICAgICAgICArPSBwaHkt
bXRrLXhzcGh5Lm8KPiA+ICsKPiA+ICtwaHktbXRrLWhkbWktZHJ2LW9ianMgOj0gcGh5LW10ay1o
ZG1pLm8gXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICBwaHktbXRrLWhkbWktbXQyNzAxLm8g
XAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICBwaHktbXRrLWhkbWktbXQ4MTczLm8KPiA+ICsK
PiA+ICtvYmotJChDT05GSUdfUEhZX01US19IRE1JKSArPSBwaHktbXRrLWhkbWktZHJ2Lm8KPiA+
ICsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210MjcwMV9o
ZG1pX3BoeS5jIGIvZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10MjcwMS5jCj4g
PiBzaW1pbGFyaXR5IGluZGV4IDk5JQo+ID4gcmVuYW1lIGZyb20gZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19tdDI3MDFfaGRtaV9waHkuYwo+ID4gcmVuYW1lIHRvIGRyaXZlcnMvcGh5L21l
ZGlhdGVrL3BoeS1tdGstaGRtaS1tdDI3MDEuYwo+ID4gaW5kZXggOTlmZTA1Y2QzNTk4Li5hNmNi
MWRlYTNkMGMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210
MjcwMV9oZG1pX3BoeS5jCj4gPiArKysgYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhk
bWktbXQyNzAxLmMKPiA+IEBAIC00LDcgKzQsNyBAQAo+ID4gICAqIEF1dGhvcjogQ2h1bmh1aSBE
YWkgPGNodW5odWkuZGFpQG1lZGlhdGVrLmNvbT4KPiA+ICAgKi8KPiA+Cj4gPiAtI2luY2x1ZGUg
Im10a19oZG1pX3BoeS5oIgo+ID4gKyNpbmNsdWRlICJwaHktbXRrLWhkbWkuaCIKPiA+Cj4gPiAg
I2RlZmluZSBIRE1JX0NPTjAgICAgMHgwMAo+ID4gICNkZWZpbmUgUkdfSERNSVRYX0RSVl9JQklB
UyAgICAgICAgICAwCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19tdDgxNzNfaGRtaV9waHkuYyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS1t
dDgxNzMuYwo+ID4gc2ltaWxhcml0eSBpbmRleCA5OSUKPiA+IHJlbmFtZSBmcm9tIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlfcGh5LmMKPiA+IHJlbmFtZSB0byBkcml2
ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWktbXQ4MTczLmMKPiA+IGluZGV4IGI1NWY1MTY3
NTIwNS4uMzUyMWM0ODkzYzUzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19tdDgxNzNfaGRtaV9waHkuYwo+ID4gKysrIGIvZHJpdmVycy9waHkvbWVkaWF0ZWsv
cGh5LW10ay1oZG1pLW10ODE3My5jCj4gPiBAQCAtNCw3ICs0LDcgQEAKPiA+ICAgKiBBdXRob3I6
IEppZSBRaXUgPGppZS5xaXVAbWVkaWF0ZWsuY29tPgo+ID4gICAqLwo+ID4KPiA+IC0jaW5jbHVk
ZSAibXRrX2hkbWlfcGh5LmgiCj4gPiArI2luY2x1ZGUgInBoeS1tdGstaGRtaS5oIgo+ID4KPiA+
ICAjZGVmaW5lIEhETUlfQ09OMCAgICAgICAgICAgIDB4MDAKPiA+ICAjZGVmaW5lIFJHX0hETUlU
WF9QTExfRU4gICAgICAgICAgICAgQklUKDMxKQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaV9waHkuYyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1t
dGstaGRtaS5jCj4gPiBzaW1pbGFyaXR5IGluZGV4IDk5JQo+ID4gcmVuYW1lIGZyb20gZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3BoeS5jCj4gPiByZW5hbWUgdG8gZHJpdmVycy9w
aHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLmMKPiA+IGluZGV4IGZlMDIyYWNkZGJlZi4uOGZjODNm
MDFhNzIwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
X3BoeS5jCj4gPiArKysgYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuYwo+ID4g
QEAgLTQsNyArNCw3IEBACj4gPiAgICogQXV0aG9yOiBKaWUgUWl1IDxqaWUucWl1QG1lZGlhdGVr
LmNvbT4KPiA+ICAgKi8KPiA+Cj4gPiAtI2luY2x1ZGUgIm10a19oZG1pX3BoeS5oIgo+ID4gKyNp
bmNsdWRlICJwaHktbXRrLWhkbWkuaCIKPiA+Cj4gPiAgc3RhdGljIGludCBtdGtfaGRtaV9waHlf
cG93ZXJfb24oc3RydWN0IHBoeSAqcGh5KTsKPiA+ICBzdGF0aWMgaW50IG10a19oZG1pX3BoeV9w
b3dlcl9vZmYoc3RydWN0IHBoeSAqcGh5KTsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmggYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRr
LWhkbWkuaAo+ID4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gPiByZW5hbWUgZnJvbSBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfcGh5LmgKPiA+IHJlbmFtZSB0byBkcml2ZXJzL3Bo
eS9tZWRpYXRlay9waHktbXRrLWhkbWkuaAo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
