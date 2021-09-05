Return-Path: <SRS0=a7PR=N3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A8DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 04:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E37EA60FE6
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 04:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E37EA60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4BoeS/jnTTZpC21lVBnksPXpxnHLjL5FIFYvt8/cchQ=; b=krVWNMfIpB+2Tk
	g/pzSlOAxilua1AQzI21jUrhQITl9f2Am6TfCxf1GVs6gaEvIBT40noagaIhuSv+9P+CbO1OR8CL0
	1osf1a3QkTBXavSQi+Q1ibmglKWiHlz1uwXu50LRQ7eXMhljVdCqyMQZvVwRPAN4UMOTaxu42cMDq
	0trV2y2LhkDj4H/Aljhh5w85cjGq8b1LR4d4XE6gm7mMIWHGJAAdM3GrvMrAcCPGCO7njhFIcvl/T
	ifBhkh0/GbWgi8QgOU9IqqzBAs1fmhHxvrixVcbUvCYOZN3sK+HaDx+GZ50he6bjl4ltJlQVOYXej
	YW3TXbY8L+OCJgdt+vgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMjVF-00FCCc-US; Sun, 05 Sep 2021 04:11:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMjV2-00FCAN-KQ; Sun, 05 Sep 2021 04:11:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90AA260232;
 Sun,  5 Sep 2021 04:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630815079;
 bh=FJt08tLv94mGzxxoL9aKwkbFQx3aABVQCv3d6GkPJ50=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BkGVJHzzLOWSqg7qiTcFvDwkAz7IvFkSPRqU6MLqjnzLUWEoRoJy2C04dJn99rBm2
 8jPItABi5toutqoXFN7bM90fBVnhJctZFwug62V6r3xFeTscbRp0JvDH9H/A3LN+TT
 W1Gmfpo56UaDXGE87GY5qVU9754eKQXwsBguLTUYTDkTq2/pIgOa2Frcjx94/5JwHH
 9a8KzjE3uUo790W8f4D/3x8jzlwDMQvYaar4a1HpaQQ6gzzyLlZdudj0/SfiokpXOl
 P7hUBdLNpNlY3VNCQ65Oe/ZsaSCUQGvr3dTsCkfHEB03sj3RhWEtR3Bo3svALVk8rp
 j18hxIAIQzSfg==
Received: by mail-ej1-f47.google.com with SMTP id u14so6307461ejf.13;
 Sat, 04 Sep 2021 21:11:19 -0700 (PDT)
X-Gm-Message-State: AOAM530J2qJ7rGnCEuHoMJiUfLEa7Jd1We7pzwzfChF4N171NnBVHAXS
 y5QGqgk4Bt4SdrcfzpYVgcsEzYchvcUSCYN5Rg==
X-Google-Smtp-Source: ABdhPJxuQktwkT66NyxvIWF/PbhLjJE31qsp+wgNqVEER3VZSiT7tBa60/3ZxcrdU/9Low1/zRYZ7e6Rc2WPzONInhU=
X-Received: by 2002:a17:906:26c4:: with SMTP id
 u4mr6927063ejc.511.1630815078141; 
 Sat, 04 Sep 2021 21:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
 <20210825144833.7757-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20210825144833.7757-5-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Sep 2021 12:11:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8XoeNVWqYpGPyUS-9X4jrjo8N=QxoBY0oD8nfeVMsESA@mail.gmail.com>
Message-ID: <CAAOTY_8XoeNVWqYpGPyUS-9X4jrjo8N=QxoBY0oD8nfeVMsESA@mail.gmail.com>
Subject: Re: [PATCH v9 04/14] dt-bindings: mediatek: add mediatek, dsc.yaml for
 mt8195 SoC binding
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, fshao@chromium.org, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_211120_729497_9B11516A 
X-CRM114-Status: GOOD (  19.38  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDjmnIgyNeaXpSDpgLHkuIkg5LiL5Y2IMTA6NDjlr6vpgZPvvJoKPgo+IDEuIEFkZCBt
ZWRpYXRlayxkc2MueWFtbCB0byBkZXNjcmliZSBEU0MgbW9kdWxlIGluIGRldGFpbHMuCj4gMi4g
QWRkIG10ODE5NSBTb0MgYmluZGluZyB0byBtZWRpYXRlayxkc2MueWFtbC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
Li4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwgICAgICAgIHwgNzAgKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2MueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRzYy55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmYyNmUzMDEwZDVmNAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2MueWFtbAo+IEBAIC0w
LDAgKzEsNzAgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sIwo+ICsk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiAr
Cj4gK3RpdGxlOiBtZWRpYXRlayBkaXNwbGF5IERTQyBjb250cm9sbGVyCgpNZWRpYXRlawoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIENodW4tS3Vhbmcg
SHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ICsgIC0gUGhpbGlwcCBaYWJlbCA8cC56YWJl
bEBwZW5ndXRyb25peC5kZT4KPiArCj4gK2Rlc2NyaXB0aW9uOiB8Cj4gKyAgVGhlIERTQyBzdGFu
ZGFyZCBpcyBhIHNwZWNpZmljYXRpb24gb2YgdGhlIGFsZ29yaXRobXMgdXNlZCBmb3IKPiArICBj
b21wcmVzc2luZyBhbmQgZGVjb21wcmVzc2luZyBpbWFnZSBkaXNwbGF5IHN0cmVhbXMsIGluY2x1
ZGluZwo+ICsgIHRoZSBzcGVjaWZpY2F0aW9uIG9mIHRoZSBzeW50YXggYW5kIHNlbWFudGljcyBv
ZiB0aGUgY29tcHJlc3NlZAo+ICsgIHZpZGVvIGJpdCBzdHJlYW0uIERTQyBpcyBkZXNpZ25lZCBm
b3IgcmVhbC10aW1lIHN5c3RlbXMgd2l0aAo+ICsgIHJlYWwtdGltZSBjb21wcmVzc2lvbiwgdHJh
bnNtaXNzaW9uLCBkZWNvbXByZXNzaW9uIGFuZCBEaXNwbGF5Lgo+ICsKPiArcHJvcGVydGllczoK
PiArICBjb21wYXRpYmxlOgo+ICsgICAgb25lT2Y6Cj4gKyAgICAgIC0gaXRlbXM6Cj4gKyAgICAg
ICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtZGlzcC1kc2MKPiArCj4gKyAgcmVnOgo+ICsg
ICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgaW50ZXJydXB0czoKPiArICAgIG1heEl0ZW1zOiAxCj4g
Kwo+ICsgIGNsb2NrczoKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEU0Mg
V3JhcHBlciBDbG9jawo+ICsKPiArICBwb3dlci1kb21haW5zOgo+ICsgICAgZGVzY3JpcHRpb246
IEEgcGhhbmRsZSBhbmQgUE0gZG9tYWluIHNwZWNpZmllciBhcyBkZWZpbmVkIGJ5IGJpbmRpbmdz
IG9mCj4gKyAgICAgIHRoZSBwb3dlciBjb250cm9sbGVyIHNwZWNpZmllZCBieSBwaGFuZGxlLiBT
ZWUKPiArICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3Bvd2Vy
LWRvbWFpbi55YW1sIGZvciBkZXRhaWxzLgo+ICsKPiArCj4gKyAgbWVkaWF0ZWssZ2NlLWNsaWVu
dC1yZWc6Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhlIHJlZ2lzdGVyIG9mIGNsaWVu
dCBkcml2ZXIgY2FuIGJlIGNvbmZpZ3VyZWQgYnkgZ2NlIHdpdGggNCBhcmd1bWVudHMgZGVmaW5l
ZAo+ICsgICAgICBpbiB0aGlzIHByb3BlcnR5LCBzdWNoIGFzIHBoYW5kbGUgb2YgZ2NlLCBzdWJz
eXMgaWQsIHJlZ2lzdGVyIG9mZnNldCBhbmQgc2l6ZS4KPiArICAgICAgRWFjaCBzdWJzeXMgaWQg
aXMgbWFwcGluZyB0byBhIGJhc2UgYWRkcmVzcyBvZiBkaXNwbGF5IGZ1bmN0aW9uIGJsb2NrcyBy
ZWdpc3Rlcgo+ICsgICAgICB3aGljaCBpcyBkZWZpbmVkIGluIHRoZSBnY2UgaGVhZGVyIGluY2x1
ZGUvaW5jbHVkZS9kdC1iaW5kaW5ncy9nY2UvPGNoaXA+LWdjZS5oLgo+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+ICsgICAgbWF4SXRl
bXM6IDEKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0gcmVnCj4gKyAg
LSBpbnRlcnJ1cHRzCj4gKyAgLSBwb3dlci1kb21haW5zCj4gKyAgLSBjbG9ja3MKPiArCj4gK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKwo+
ICsgICAgZHNjMDogZGlzcF9kc2Nfd3JhcEAxYzAwOTAwMCB7Cj4gKyAgICAgICAgY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDgxOTUtZGlzcC1kc2MiOwo+ICsgICAgICAgIHJlZyA9IDwwIDB4MWMw
MDkwMDAgMCAweDEwMDA+Owo+ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA2NDUgSVJR
X1RZUEVfTEVWRUxfSElHSCAwPjsKPiArICAgICAgICBwb3dlci1kb21haW5zID0gPCZzcG0gTVQ4
MTk1X1BPV0VSX0RPTUFJTl9WRE9TWVMwPjsKPiArICAgICAgICBjbG9ja3MgPSA8JnZkb3N5czAg
Q0xLX1ZETzBfRFNDX1dSQVAwPjsKPiArICAgICAgICBtZWRpYXRlayxnY2UtY2xpZW50LXJlZyA9
IDwmZ2NlMSBTVUJTWVNfMWMwMFhYWFggMHg5MDAwIDB4MTAwMD47Cj4gKyAgICB9Owo+IC0tCj4g
Mi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
