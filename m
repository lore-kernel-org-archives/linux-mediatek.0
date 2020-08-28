Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D70C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 05:27:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E7C20791
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 05:27:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOEthA5I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="hlERtq7R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E7C20791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRW4dirFzT/+af1V40zqj/57oKK1WAO0YCEEyZl1DDI=; b=TOEthA5I7KLT0nBvpmhvk0mP5f
	2lDjyluImg1pGuNDAhbMXe3h3qYsyRSDEk42gqJuIHvbN3cMrAfkStiCM6ojkXM28oZpXIOqxq4Wa
	2YoUfEvqS4RrxuzZUwsETwhddqsfxDYp2j4sr/sUvBSW3HErnHtne+abY+sfxJM7Y+oIquCF7gCSA
	ZuKiIpNy3qV+/xwo+EHgDk6K2teZuNylae0SaHsfZC8hqI5GrVX5KsCjGlf+Q18QRR15mQUMcSzEY
	2j9dpu/KgrXJ8qE4GNBFLNQEjF2MS95V2Pfs8rD2FF05stN0lfGN+EvdM45MYptBtO2W1ucokSnRE
	3+10mmnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBWvH-0003LB-OJ; Fri, 28 Aug 2020 05:27:35 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBWvD-0003KQ-Cz; Fri, 28 Aug 2020 05:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598592444;
 bh=WD3AJvfzF9oAQ+hbHrZsou5r5C78WR8jKTk/O/wDxkc=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=hlERtq7RVSNU3QipsThnm+kywf4O8CaAWHbtz56k0ulrz5sp1Lr26HdpbBMHbfoR4
 SGpaTo3I3ZQhE8WKauKgFVnVFSWJpjLxZciPfLb0n2g638ocSHKxNV903tjKaFI2Lj
 2xkp+dENNn6zy1Q94UxMRGO0jcfY8hHLuZkl/G7c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([185.53.41.233]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwwdl-1kW4vD0uKZ-00yTBG; Fri, 28
 Aug 2020 07:21:52 +0200
Date: Fri, 28 Aug 2020 07:21:46 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
 <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
 <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
 <e0edfd9f-5916-80ee-3bef-92d7050f97db@gmail.com>
 <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Aw: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <B3A0E53D-ADC0-4D67-B9C2-70009DDD5D36@public-files.de>
X-Provags-ID: V03:K1:7PW5OPifrURLSHF7MjbrcWo5/B8RnBtD0szhETXVFhtYaU1kflx
 8RahuKcyckTIREd1Fujksg+Qo9pSqdK75DMSepPIN5mlJqSxvoSRfvem2ypHN5VizKwVrZw
 Z/6Of3tVfXrI1Nj4Ts4XF2VzbDbe9fIkdJWfnCCweJe0FLWrzWP1Pl4e8bCca9DBES1LOZl
 mp6yVVTPMo0VfSfa560xw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Od1gIiAwDfM=:EbCLBtKmVfjJPgXg3SgdP1
 ymkzLsFbPaTlIr5gjXTB0WaTj3PovZkAGFoGitErY4UirKxy3OeOwpErqqqR4CBZmHyl1MZDU
 9nCs3knOs2iVJZZ9VOslpLNuB9qQykKIKtQ3OUGnRSp56F+sF3mFHXU6kECl53OTUG7mBzZpI
 5rqLIB6YH+4m+WPiFq9WL0VwYg/RBcos7q3+fdJWsp7rIaKmQtx66oOgpRfyO8NkLdoS7T3nd
 p/mdU1mpXsNa3VGJ9P1xfFvYIQLuMnvzDG3do2UUBahXPYA3iMS2VKjUp81qURZHbbfh4CGZI
 h/u1mcGYqdoKBury2onm4abl4I08U9m7kHmq+oduwQMEom/FUa7fxwYuVjP2sDKRhAZ7LgWrx
 sd4C+zZ0Tt0viVtfxZxzyFtsuhWiOZtql/SzyaneUsRiPFApW3X4aIBOSrNgwkE4Xy3S6ii3w
 N8lN4geRQcnbnrGRRQswYnz5Zq8hFBZ8X8J+LkmmC4qsKrKX3k02FQAwt2Sc1saB/CvRIGKN7
 tFqoI2/QkS/vK4xvsYVXGVWPyGn7KUrarGr+Zs4VpjvZEitrLIHrifwwzTnArmgi8lWCILqeX
 mMT9dkZnQLBwWKGubClrpTWBBTegNmhZIOf7NeI29xFq4MngzbcNZ+8BkdmiESJzhm/zSXKV/
 nlH5E6w5vERC4zEwZu4eQ6MB6Tmo0SXRjTd500YyTdpJCPIFZ0Lv14tDY8mYkKLYsvGbWfmo8
 cBG+111AUdK/Gn79VTrRRfmMp8Xog4ZpwXh6B6omqp7Vqc9tDfJRitTSauSGu6x5n5TwqMV5F
 4jGkNwMOHofV2q4Xsj9odD4qRmGOOy5uDTV5Rqc4VMNcJPSIqEAbG553G96yAkArr7nqPdsxn
 iHUoP+Cr5zayiP0Y+60XnYibvd2TSx5SsQqMPUFA9Q4YWYCLSjxv80d0ye44VpkAGeqToOXUR
 YMhXl9EmVRjngNYt1/oF8UYciQean50t5W075xuaDWjx0LZv3HphN7YETM9ciLBQJrjsH4zyB
 DhWtZ7Wuw+Y5Ups59yeij9xBXXsMpWuMLmJ8SVplKIlnfYHNqwu6FxmvLTWRBD2+4ht5Lg5Ix
 8WAxmE9Vv9ofSBRinTy/+/hTbMLD54uYeb+tps9jSf6hW1j5xEWC2uDssBMhyrF8Qp6H31Hi9
 yqZ2BQVl3V85bCmHPtPPQy05jcY6ngBDEKghXY+UG6wSugKC6rMk5HxzH5d20mHrVV8COosEU
 wTQpa8RXq+MJLr0yNiRqs6L6lR63wLHdTviX7FQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_012731_694087_3E303187 
X-CRM114-Status: GOOD (  12.35  )
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
Reply-To: frank-w@public-files.de
Cc: chunkuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

V2l0aG91dCB0aGlzIHBhdGNoIGkgaGF2ZSBmbGlja2VyaW5nL2hvcml6b250YWwgZGlzdG9ydGlv
biAobG9va3MgbGluZSBldmVyeSBzZWNvbmQgbGluZSBoYXMgZGlmZmVyZW50IHggcG9zaXRpb24g
YXMgb25lIGFib3ZlIGFwcHJveC4gNSBweCkgb24gbXkgMTI4MHgxMDI0IHRmdC4KCkZiY29uIGlz
IHVucmVhZGFibGUgd2l0aCB0aGlzIHByb2JsZW0uCgpIYXJkIHRvIGRlc2NyaWJlIGJ5IHdvcmRz
IG9ubHkgOigKCkFtIDI4LiBBdWd1c3QgMjAyMCAwMTo0NjowNyBNRVNaIHNjaHJpZWIgQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Ogo+SGksIEZyYW5rOgo+Cj5NYXR0aGlh
cyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPiDmlrwgMjAyMOW5tDjmnIgyN+aXpSDp
gLHlm5sg5LiL5Y2IMTA6Mjjlr6vpgZPvvJoKPj4KPj4KPj4KPj4gT24gMjcvMDgvMjAyMCAxNTo0
MSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPj4gPiBIaSBNYXR0aGlhcywKPj4gPgo+PiA+IGFu
eSBvcGluaW9ucyBhYm91dCB0aGUgZHRzLWNoYW5nZXM/Cj4+ID4KPj4KPj4gdGhleSBsb29rIGdv
b2QgdG8gbWUuCj4+Cj4+ID4gbWF5YmUgc2VyaWVzIGV4Y2VwdCB0aGUgdG1kcy1QYXRjaCBnZXQg
bWVyZ2VkLi4uc28gaSBhZGQgaXQgb25seSB0bwo+bXkgb3duIHJlcG8gdGlsbCB3ZSBmaW5kIGEg
YmV0dGVyIHdheT8KPj4gPiBjdXJyZW50bHkgbWFpbmxpbmUgZG9lcyBub3Qgc3VwcG9ydCBoZG1p
IGF0IGFsbCBmb3IgdGhlIGJvYXJkLiB0aGUKPnRtZHMtcGF0Y2ggaXMgb25seSBhIGZpeCBmb3Ig
c3BlY2lmaWMgcmVzb2x1dGlvbnMgd2hpY2ggaGF2ZSBhCj4iZmxpY2tlcmluZyIgd2l0aG91dCB0
aGlzIFBhdGNoLgo+PiA+Cj4+Cj4+IFdlbGwgbGV0J3Mgc2VlIHdoYXQgQ0sncyBvcGluaW9uLgo+
Pgo+Cj5CZWNhdXNlIG5vIG9uZSBoYXMgY29tbWVudCBvbiB0aGlzIHBhdGNoLCBJIGNvdWxkIGFw
cGx5IHRoaXMgcGF0Y2ggYnV0Cj5JIG5lZWQgeW91IHRvIGFkZCBtb3JlIGV4cGVyaW1lbnQgaW5m
b3JtYXRpb24gc28gaWYgc29tZW9uZSBtZWV0cwo+YW5vdGhlciBidWcsIGhlIGNvdWxkIGZpeCBo
aXMgYnVnIGFuZCBjb25zaWRlciB5b3VyIHByb2JsZW0uCj4KPlJlZ2FyZHMsCj5DaHVuLUt1YW5n
Lgo+Cj4+IFJlZ2FyZHMsCj4+IE1hdHRoaWFzCj4KPl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj5MaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCnJlZ2FyZHMgRnJhbmsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
