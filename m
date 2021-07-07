Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82F3C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 14:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F9F3600CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 14:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F9F3600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anEbdDK9EbHeskBbhlOrQpHITz4z1YYYgUL98oiKYWI=; b=W8mK0NGYGAf/7e
	11EsOxgZy7IF1w3bQlAVeSx4haBjCMMgOM8Rk+i0u/ELmKhtUYd4mEWQxu5ipLVTQ7S3jsUxKOfv9
	JlS7o6sFQJODxJY5tuhLdR9VdS/4JAchI6gctd0ccnGJlXsC5d5HKCoB7E3/w62CfD4rn3zOnTMuW
	YW1W40caey40ylRqTdpC1w3WL2rIikT9PyCZR1aD9D6KTTiybNFE8MbUvnwPjTa4gHYXXEy98QPVS
	9VdPASIOlbVDN0lNVHRvfLOaGBi4vZ0bc7rhj/HeeH/qIcsIdoxzHN/mSMVtmW4aVPFAGQzYOzw8z
	ksHoEY0W/XFw2Rwd0uRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1919-00F8sI-9L; Wed, 07 Jul 2021 14:59:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1915-00F8rG-Ol
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 14:59:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F5D861CC8
 for <linux-mediatek@lists.infradead.org>; Wed,  7 Jul 2021 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625669951;
 bh=Ld0W/CO5KSH5eewJQxSXvg+l75fMEAzgdAszdXdVTd8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ntguiwzcJYY3n/YJQHFdemX2SZy4jLgEc2m+XLtWj2yf+mglGmuj7yGVYwsotMVHY
 4YX+jk2yx/4W3i/vU5uS/k0DIi2TO1ibA2yJPhdTUFek21HiuOLsFBzYfafnoO/FmZ
 EPKV2wOyHIVaC9cyG0qQk8G204epqC0hbqzNewR7EjTF1idF85IktL4xfl+QUm02qE
 jCfDdxX9HoAhqSfNvRM0kYOMetpYQtX63nl5F0rfpd19sWwCSjoiMxXom6MgzuWNuH
 Vyiz56KknKW3QcGds6h39hMxcnnmqPGwjB7wbn5Z6MQhk+s+ba8LMzODsbDnOgSmCg
 4KtsrUEpijVDA==
Received: by mail-ej1-f45.google.com with SMTP id ga42so3747278ejc.6
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Jul 2021 07:59:10 -0700 (PDT)
X-Gm-Message-State: AOAM533Kxqzz6onnkvWt6yhQQQy1eMVQzP80V80Xt9oUTx931DjVIWFu
 rsgHgfpwTGotw1ZiDbICfQjaJD8B1hjhiGplGQ==
X-Google-Smtp-Source: ABdhPJzBfvKCM1iiYyRCcQ9GQgMtxZexYRJ/jKRyf1Zi5QywB3sD6sNRI8uKuDJN/UVBK3R1sNbCiyOPXTZKczUd5YA=
X-Received: by 2002:a17:906:4745:: with SMTP id
 j5mr4539593ejs.75.1625669949495; 
 Wed, 07 Jul 2021 07:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <YOQ8ktv1MypezrEy@phenom.ffwll.local>
 <trinity-9886112a-f7f2-4ae8-8e09-39c73c04b751-1625571632221@3c-app-gmx-bs60>
In-Reply-To: <trinity-9886112a-f7f2-4ae8-8e09-39c73c04b751-1625571632221@3c-app-gmx-bs60>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Jul 2021 22:58:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Qkqx0Ex1ezfWb+55+T1eytJrZXP=J-fwCe_g1U=4qBw@mail.gmail.com>
Message-ID: <CAAOTY__Qkqx0Ex1ezfWb+55+T1eytJrZXP=J-fwCe_g1U=4qBw@mail.gmail.com>
Subject: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_075911_862357_59F75182 
X-CRM114-Status: GOOD (  35.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIx5bm0N+aciDbml6Ug6YCx5LqMIOS4i+WNiDc6NTTlr6vpgZPvvJoKPgo+IEhpIERhbmll
bAo+Cj4gPiBHZXNlbmRldDogRGllbnN0YWcsIDA2LiBKdWxpIDIwMjEgdW0gMTM6MjAgVWhyCj4g
PiBWb246ICJEYW5pZWwgVmV0dGVyIiA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQW46ICJGcmFuayBX
dW5kZXJsaWNoIiA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+Cj4gPiBDYzogIk1hYXJ0ZW4gTGFu
a2hvcnN0IiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPiwgIk1heGltZSBSaXBh
cmQiIDxtcmlwYXJkQGtlcm5lbC5vcmc+LCAiVGhvbWFzIFppbW1lcm1hbm4iIDx0emltbWVybWFu
bkBzdXNlLmRlPiwgIkRhdmlkIEFpcmxpZSIgPGFpcmxpZWRAbGludXguaWU+LCAiRGFuaWVsIFZl
dHRlciIgPGRhbmllbEBmZndsbC5jaD4sIGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcs
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsICJDaHVuLUt1YW5nIEh1IiA8Y2h1bmt1YW5n
Lmh1QGtlcm5lbC5vcmc+LCAiUGhpbGlwcCBaYWJlbCIgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+
LCBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnLCAiTWF0dGhpYXMgQnJ1Z2dlciIg
PG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gPiBCZXRyZWZmOiBSZTogQlVHOiBNVEsgRFJNL0hE
TUkgYnJva2VuIG9uIDUuMTMgKG10NzYyMy9icGktcjIpCj4gPgo+ID4gT24gVHVlLCBKdWwgMDYs
IDIwMjEgYXQgMTE6NTQ6MzlBTSArMDIwMCwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPiA+ID4g
SGksCj4gPiA+Cj4gPiA+IGkndmUgbm90aWNlZCB0aGF0IEhETUkgaXMgYnJva2VuIGF0IGxlYXN0
IG9uIG15IGJvYXJkIChCYW5hbmFwaS1yMixtdDc2MjMpIG9uIDUuMTMuCj4gPiA+Cj4gPiA+IGFm
dGVyIHNvbWUgcmVzZWFyY2ggaSBub3RpY2VkIHRoYXQgaXQgaXMgd29ya2luZyB0aWxsCj4gPiA+
Cj4gPiA+IGNvbW1pdCAyZTQ3NzM5MTUyMjM1NGU3NjNhYTYyZWUzZTI4MWMxYWQ5ZThlYjFiCj4g
PiA+IEF1dGhvcjogRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEu
Y29tPgo+ID4gPiBEYXRlOiAgIFR1ZSBNYXIgMzAgMTM6MDk6MDIgMjAyMSArMDIwMAo+ID4gPgo+
ID4gPiAgICAgZHJtL21lZGlhdGVrOiBEb24ndCBzdXBwb3J0IGhkbWkgY29ubmVjdG9yIGNyZWF0
aW9uCj4gPiA+Cj4gPiA+Cj4gPiA+IHdoaWNoIGlzIHRoZSBsYXN0IG9mIG10ay1kcm0tbmV4dC01
LjEzIFsxXSBzbyBpIGd1ZXNzIGEgcHJvYmxlbSB3aXRoIGNvcmUtcGF0Y2hlcwo+ID4gPgo+ID4g
PiBkbWVzZyBzaG93cyB0aGUgZm9sbG93aW5nOgo+ID4gPgo+ID4gPiBbICAgIDcuMDcxMzQyXSBt
ZWRpYXRlay1kcm0gbWVkaWF0ZWstZHJtLjEuYXV0bzogYm91bmQgMTQwMDcwMDAub3ZsIChvcHMg
bXRrX2Rpcwo+ID4gPiBwX292bF9jb21wb25lbnRfb3BzKQo+ID4gPiBbICAgIDcuMDgwMzMwXSBt
ZWRpYXRlay1kcm0gbWVkaWF0ZWstZHJtLjEuYXV0bzogYm91bmQgMTQwMDgwMDAucmRtYSAob3Bz
IG10a19kaQo+ID4gPiBzcF9yZG1hX2NvbXBvbmVudF9vcHMpCj4gPiA+IFsgICAgNy4wODk0Mjld
IG1lZGlhdGVrLWRybSBtZWRpYXRlay1kcm0uMS5hdXRvOiBib3VuZCAxNDAwYjAwMC5jb2xvciAo
b3BzIG10a19kCj4gPiA+IGlzcF9jb2xvcl9jb21wb25lbnRfb3BzKQo+ID4gPiBbICAgIDcuMDk4
Njg5XSBtZWRpYXRlay1kcm0gbWVkaWF0ZWstZHJtLjEuYXV0bzogYm91bmQgMTQwMTIwMDAucmRt
YSAob3BzIG10a19kaQo+ID4gPiBzcF9yZG1hX2NvbXBvbmVudF9vcHMpCj4gPiA+IFsgICAgNy4x
MDc4MTRdIG1lZGlhdGVrLWRybSBtZWRpYXRlay1kcm0uMS5hdXRvOiBib3VuZCAxNDAxNDAwMC5k
cGkgKG9wcyBtdGtfZHBpCj4gPiA+IF9jb21wb25lbnRfb3BzKQo+ID4gPiBbICAgIDcuMTE2MzM4
XSBtZWRpYXRlay1kcm0gbWVkaWF0ZWstZHJtLjEuYXV0bzogTm90IGNyZWF0aW5nIGNydGMgMSBi
ZWNhdXNlIGNvbQo+ID4gPiBwb25lbnQgOSBpcyBkaXNhYmxlZCBvciBtaXNzaW5nCj4gPiA+IC4u
Li4KPiA+ID4gWyAgIDM4LjQwMzk1N10gQ29uc29sZTogc3dpdGNoaW5nIHRvIGNvbG91ciBmcmFt
ZSBidWZmZXIgZGV2aWNlIDE2MHg2NAo+ID4gPiBbICAgNDguNTE2Mzk4XSBbZHJtOmRybV9jcnRj
X2NvbW1pdF93YWl0XSAqRVJST1IqIGZsaXBfZG9uZSB0aW1lZCBvdXQKPiA+ID4gWyAgIDQ4LjUx
NjQyMl0gW2RybTpkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9kZXBlbmRlbmNpZXNdICpFUlJP
UiogW0NSVEM6NDE6Y3IKPiA+ID4gdGMtMF0gY29tbWl0IHdhaXQgdGltZWQgb3V0Cj4gPiA+IFsg
ICA1OC43NTYzODRdIFtkcm06ZHJtX2NydGNfY29tbWl0X3dhaXRdICpFUlJPUiogZmxpcF9kb25l
IHRpbWVkIG91dAo+ID4gPiBbICAgNTguNzU2Mzk5XSBbZHJtOmRybV9hdG9taWNfaGVscGVyX3dh
aXRfZm9yX2RlcGVuZGVuY2llc10gKkVSUk9SKiBbQ09OTkVDVE9SOgo+ID4gPiAzMjpIRE1JLUEt
MV0gY29tbWl0IHdhaXQgdGltZWQgb3V0Cj4gPiA+IFsgICA2OC45OTYzODRdIFtkcm06ZHJtX2Ny
dGNfY29tbWl0X3dhaXRdICpFUlJPUiogZmxpcF9kb25lIHRpbWVkIG91dAo+ID4gPiBbICAgNjgu
OTk2Mzk5XSBbZHJtOmRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX2RlcGVuZGVuY2llc10gKkVS
Uk9SKiBbUExBTkU6MzM6cAo+ID4gPiBsYW5lLTBdIGNvbW1pdCB3YWl0IHRpbWVkIG91dAo+ID4g
PiBbICAgNjguOTk2NDIzXSBbZHJtOm10a19kcm1fY3J0Y19hdG9taWNfYmVnaW5dICpFUlJPUiog
bmV3IGV2ZW50IHdoaWxlIHRoZXJlIGlzCj4gPiA+IHN0aWxsIGEgcGVuZGluZyBldmVudAo+ID4g
PiBbICAgNjkuMTA2Mzg1XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiA+
ID4gWyAgIDY5LjEwNjM5Ml0gV0FSTklORzogQ1BVOiAyIFBJRDogNyBhdCBkcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY19oZWxwZXIuYzoxNTEKPiA+ID4gMSBkcm1fYXRvbWljX2hlbHBlcl93YWl0
X2Zvcl92YmxhbmtzLnBhcnQuMCsweDJhMC8weDJhOAo+ID4gPiBbICAgNjkuMTA2NDE0XSBbQ1JU
Qzo0MTpjcnRjLTBdIHZibGFuayB3YWl0IHRpbWVkIG91dAo+ID4gPgo+ID4gPiBzbyBpIGd1ZXNz
IHRoZSBicmVha2luZyBjb21taXQgbWF5IGJlIHRoaXM6Cj4gPiA+Cj4gPiA+ICQgZ2l0IGxvZ29u
ZSAtUyJkcm1fY3J0Y19jb21taXRfd2FpdCIgLS0gZHJpdmVycy9ncHUvZHJtLwo+ID4gPiBiOTlj
MmM5NTQxMmMgMjAyMS0wMS0xMSBkcm06IEludHJvZHVjZSBhIGRybV9jcnRjX2NvbW1pdF93YWl0
IGhlbHBlcgo+ID4gPgo+ID4gPiBpbiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY3ssX2hlbHBl
cn0uYwo+ID4gPgo+ID4gPiBidXQgaSBjYW5ub3QgY29uZmlybSBpdCBiZWNhdXNlIG15IGdpdCBi
aXNlY3QgZG9lcyBzdHJhbmdlIHRoaW5ncyAoYWZ0ZXIKPiA+ID4gZGVmaW5pbmcgNS4xMyBhcyBi
YWQgYW5kIHRoZSAyZTQ3NzM5MTUyMjMgYXMgZ29vZCwgc2Vjb25kIHN0ZXAgaXMgYmVmb3JlCj4g
PiA+IHRoZSBnb29kIGNvbW1pdCB0aWxsIHRoZSBlbmQsIGxhc3Qgc3RlcHMgYXJlIDUuMTEuLi4p
LiBzb3JyeSwgaSdtIHN0aWxsCj4gPiA+IG5ldyB0byBiaXNlY3QuCj4gPgo+ID4gZHJtIGhpc3Rv
cnkgcnVucyBpbiBwYXJhbGxlbCB3aXRoIHRoZSBtYWluIHRyZWUsIHNvIG9jY2FzaW9uYWxseSB0
aGUKPiA+IHZlcnNpb24gdGhhdCdzIHJlcG9ydGVkIGFzIGJhc2VsaW5lIGlzIGNvbmZ1c2luZyBh
bmQgb2xkZXIgdGhhbiB3aGF0IHlvdQo+ID4gbWlnaHQgZXhwZWN0LiBKdXN0IHRydXN0IGdpdCBi
aXNlY3QsIGl0J3MgZG9pbmcgdGhlIHJpZ2h0IHRoaW5nLCBhbmQgbWFrZQo+ID4gc3VyZSB5b3Ug
dGVzdCBleGFjdGx5IHRoZSBrZXJuZWwgeW91J3JlIHN1cHBvc2VkIHRvIHRlc3QuIENvbXBpbGlu
ZyB3aXRoCj4gPiBDT05GSUdfTE9DQUxWRVJTSU9OX0FVVE8gaGVscHMgYSBsb3QgdG8gbWFrZSBz
dXJlIHlvdSdyZSByZWFsbHkgYm9vdGluZwo+ID4gaW50byB0aGUgcmlnaHQgc2hhMS4KPgo+IG15
IGJ1aWxkLXNjcmlwdCBhZGRzIHNoYTEgdG8gZmlsZW5hbWUgKGZvciB0ZnRwLXVzYWdlKSBhbmQg
a2VybmVsaW5mbyAodW5hbWUgLWEpCj4KPiA+ID4gdGhlIGZpeCBpcyB0YXJnZXRpbmcgdG8gNS4x
Mi1yYzIsIGlzIGd1ZXNzIGJlY2F1c2UgQ0sgSHUncyB0cmVlIGlzIGJhc2VkCj4gPiA+IG9uIHRo
aXMuLi5idXQgdGhlIGZpeCB3YXMgbm90IGluY2x1ZGVkIGluIDUuMTItcmMyIChvbmx5IGFmdGVy
Cj4gPiA+IDUuMTIuMC4uLmdvdCBpdCBieSBtZXJnaW5nIDUuMTIuMTQpCj4gPgo+ID4gWWVhaCB0
aGF0IGNhbiBhbHNvIGhhcHBlbiBiZWNhdXNlIG9mIGFsbCB0aGUgbm9uLWxpbmVhciB0cmVlcyBp
bnZvbHZlZCBpbgo+ID4gbGludXggZGV2ZWxvcG1lbnQuCj4KPiBob3cgdG8gZmluZCB0aGUgcmVh
bCBicmVha2luZyBjb21taXQ/Cj4KPiA+ID4gbWF5YmUgeW91IGNhbiBoZWxwIG1lPwo+ID4KPiA+
IFNvIG5vdyBJJ20gY29uZnVzZWQsIHlvdSdyZSB0YWxraW5nIGFib3V0IGEgZml4LCBvciBpcyBp
dCBzdGlsbCBicm9rZW4gaW4KPiA+IGxhdGVzdCB1cHN0cmVhbT8KPiA+IC1EYW5pZWwKPgo+IGl0
IGlzIHN0aWxsIGJyb2tlbiwgYXMgaSBkaWQgbm90IGZvdW5kIHRoZSByb290IGNhdXNlLi4ub25s
eSBhIGd1ZXNzIGJhc2VkIG9uIGVycm9ycyBpbiBkbWVzZy4uLmdpdCBiaXNlY3QgcG9pbnRzIG1l
IGFmYWlyIHRvIG10NzYgd2lmaS1kcml2ZXIgd2hpY2ggaXMgY29tcGxldGVseSB1bnJlbGF0ZWQu
Li5hcyBpIHNhaWQsIHRoZSBmaXggaSBkZWZpbmVkIGFzICJsYXN0IGdvb2QiIHdhcyBubyBtb3Jl
IHRoZXJlIGFmdGVyIDJuZCBiaXNlY3Qgc3RlcC4KPgo+IFRoZSBmaXggaSBzZXQgYXMgbGFzdCBn
b29kIHdhcyBmaXhpbmcgNS4xMiBpc3N1ZSAoaGFuZGxpbmcgY29ubmVjdG9yL2NyZWF0aW5nIGJy
aWRnZSB3aXRob3V0IGl0KSwgYnV0IDUuMTMgaGFzIGEgbmV3IG9uZSAoYXRvbWljIHRpbWVvdXQs
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWN7LF9oZWxwZXJ9LmMpIHdoaWNoIGkgY2Fubm90IHRy
YWNlIHRvIHRoZSBicmVha2luZyBjb21taXQuCj4KPiByZWdhcmRzIEZyYW5rCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
