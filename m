Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B38C6369E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 19:00:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1999D2224E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 19:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YOfg8ApS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mDMN9CSv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1999D2224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=67ddtWFnSmrnZAoUN3dAQki59QUkSH2U3hOtEL1NnRQ=; b=YOfg8ApSPjhX38tQ/HAm9PmB6z
	AAxexQsGN9n3gnYKHo2Ludpf9xnSys80u0oEo5Zg7Sm7Ctah+O/dz68bNU2gPTV+cCor9utkitQFy
	h20MwZ24Svg2ItRMyQLBck67W1/ohT+7tubCJuSKz73ePuZ41pGpvPJU4iihhoNSGvEZr7R3aAahf
	ZBnpmplgdduQQpQfCXVWzHZCcS3dt+MRy0NHzbE7A0/ZwBhiS4DsKb9PaHAO4Q/l5aIUWaqmaL1HQ
	ABI3OIVaUSiMV278/fLvHsAXmyQptuvB1Lw60ZWdznbKg0nVkdA7TOOUbuH1DRTaaHdAIcw7LQJd6
	YNs+hs1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdHpw-0003YC-G7; Thu, 12 Nov 2020 19:00:48 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdHpt-0003WW-Lf
 for linux-mediatek@lists.infradead.org; Thu, 12 Nov 2020 19:00:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r17so7190847wrw.1
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2020 11:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2EhywyPLrzVauOxW6hoSN8BeHIP9/SoKOh3x4hIA4nE=;
 b=mDMN9CSv2W4PIXw03bPQQ8E6n/F1hxOhd7U5xYg0CKNVoFSNx4vt6N6nJEUd+d0NVf
 2f6ET1hpvzbE9dTYE3+AEzEL+oXMm+dQYcFG7X5DeJlH39RK3B36bhjv0Kmfgd6IjRu7
 DK6YHE4NxqI4RcOgx4vmMjk9l0jBxi6xWPEUOmu/6CIwnL3vxLJFaFpRKcG8r7qv3xgD
 dyjxn3R0n7C+dorPtETtr3Ojp3vP39NWvjuLVdBQignca7AielkWQC3zPNd4ftwjEApD
 tELbFwItnMMYVNZnKGN9qFLn5xqZXBJqd3P05jK3vJI0wJT80G2YuD83Borh2wfI9qov
 uFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2EhywyPLrzVauOxW6hoSN8BeHIP9/SoKOh3x4hIA4nE=;
 b=V/1NK/ogqZ5wA3WTqfgi5CYwDiYKBg4r5a8eJMzoPMz4Pf1Jtugz/CQmHbgKEiGOjm
 YFyfu5OJfmJ32lDe5cBmarURrJj6monh0e6/BmS9h0gjrTg/T5kndpkaFnuOI/g4JEL3
 mRxw7p2uEg1wlEps52HIzMk6BpMQvXOGWvnU826b0qbYYqLMZ77nwzplm12djWH7oQNg
 Gzii24rhOdjKsDsJedMzfPPZyqNs/b7/A9BgVLMFPN2dmksUdIbEDAWV+lThtpE4PEP1
 KB8Kw7Rf3I+o02hjmtdhDVburadxzY3o3yIWVINfFD0wOYYyCPRQYrr/AL2VqfC/wNSC
 3p7g==
X-Gm-Message-State: AOAM533NGswjf0kTBMuokOlty60UfD0obMBCKFP0mYluH9uMNqc9p+Pd
 HW+Wz2rloiL25nM9HyVKKL/lEw==
X-Google-Smtp-Source: ABdhPJyKUIdqT6yOWd6udawSWHTScPhDrEAlvpxAeKCcoYi8gRAZSrSI6RVWTEAP7uNql9pNr7za4A==
X-Received: by 2002:adf:fc01:: with SMTP id i1mr1129122wrr.250.1605207644013; 
 Thu, 12 Nov 2020 11:00:44 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:00:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 00/30] [Set 6] Rid W=1 warnings from GPU
Date: Thu, 12 Nov 2020 19:00:09 +0000
Message-Id: <20201112190039.2785914-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_140045_829268_C20D15A2 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Eric Anholt <eric@anholt.net>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Chris Zhong <zyw@rock-chips.com>, Russell King <linux@armlinux.org.uk>,
 report to <xorg-driver-ati@lists.x.org>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Eunchul Kim <chulspro.kim@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-rockchip@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, Nickey Yang <nickey.yang@rock-chips.com>,
 amd-gfx@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Jinyoung Jeon <jy0.jeon@samsung.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-media@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Akshu Agarwal <akshua@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Vincent Abriou <vincent.abriou@st.com>, Sangmin Lee <lsmin.lee@samsung.com>,
 linux-arm-kernel@lists.infradead.org, Mark Yao <mark.yao@rock-chips.com>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Jerome Glisse <glisse@freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, linux-mediatek@lists.infradead.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBjbGVhbi11
cCBXPTEKa2VybmVsIGJ1aWxkcywgd2hpY2ggYXJlIGN1cnJlbnRseSBvdmVyd2hlbG1pbmdseSBy
aWRkbGVkIHdpdGgKbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KCk5COiBIb3BlZnVsbHkgdGhlIG90
aGVyIHNldHMgdHVybiB1cCBpbiAtbmV4dCBzb29uLCBzbyB0aGV5IGNhbgpiZSByZWJhc2VkIGFu
ZCBhbnkgc3RyYWdnbGVycyByZS1zdWJtaXR0ZWQuCgpMZWUgSm9uZXMgKDMwKToKICBkcm0vc2F2
YWdlL3NhdmFnZV9iY2k6IFJlbW92ZSBzZXQgYnV0IG5ldmVyIHVzZWQgJ2FwZXJfcnNyYycgYW5k
CiAgICAnZmJfcnNyYycKICBpbmNsdWRlOiBkcm06IGRybV9hdG9taWM6IEFydGlmaWNpYWxseSB1
c2UgJ2NydGMnIHRvIGF2b2lkICdub3QgdXNlZCcKICAgIHdhcm5pbmcKICBkcm0vdjNkL3YzZF9n
ZW06IFByb3ZpZGUgZGVzY3JpcHRpb25zIGZvciAndjNkX2xvb2t1cF9ib3MncyBwYXJhbXMKICBk
cm0vdmlhL3ZpYV9kbWE6IFJlbW92ZSBzZXQgYnV0IHVudXNlZCB2YXJpYWJsZSAnYWdwX2Jhc2Un
CiAgZHJtL3YzZC92M2Rfc2NoZWQ6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jIGhl
YWRlcgogIGRybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXM6IEZpeCBtaXNuYW1pbmcgb2YgcGFyYW1l
dGVyICdkZXYnCiAgZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlOiBGaXggc29tZSBpc3N1ZXMg
cGVydGFpbmluZyB0byBmdW5jdGlvbgogICAgZG9jdW1lbnRhdGlvbgogIGRybS9leHlub3MvZXh5
bm9zN19kcm1fZGVjb246IFN1cHBseSBtaXNzaW5nIGRlc2NyaXB0aW9uIGZvciAgcGFyYW0KICAg
ICdjdHgnCiAgZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQ6IEFkZCBtaXNzaW5nIGRlc2NyaXB0
aW9uIGZvciBwYXJhbSAnY3R4JwogIGRybS92YzQvdmM0X2hkbWlfcmVnczogTWFyayBzb21lIGRh
dGEgc2V0cyBhcyBfX21heWJlX3VudXNlZAogIGRybS92YzQvdmM0X2hkbWk6IFJlbW92ZSBzZXQg
YnV0IHVudXNlZCB2YXJpYWJsZSAncmV0JwogIGRybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG06IERl
bW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jIGhlYWRlcnMsCiAgICBmaXggc2xpZ2h0bHkg
bGFja2luZyBvbmVzCiAgZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2NydGM6IEFwcGx5IGNv
cnJlY3QgZm9ybWF0dGluZyB0byBzdHJ1Y3QKICAgIGRvY3MKICBkcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmluZzogRml4IGEgYnVuY2ggb2YgZnVuY3Rpb24gbWlzZG9jdW1lbnRhdGlvbgogIGRybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5OiBSZW1vdmUgcG9pbnRsZXNzIGhlYWRlcgogIGRybS9h
dG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZTogU3RhdGljaXNlIGxvY2FsIGZ1bmN0aW9uCiAg
ICAnYXRtZWxfaGxjZGNfcGxhbmVfc2V0dXBfc2NhbGVyKCknCiAgZHJtL2F0bWVsLWhsY2RjL2F0
bWVsX2hsY2RjX3BsYW5lOiBGaXggZG9jdW1lbnRhdGlvbiBmb3JtYXR0aW5nIGFuZAogICAgYWRk
IG1pc3NpbmcgZGVzY3JpcHRpb24KICBkcm0vdmM0L3ZjNF92M2Q6IERlbW90ZSBub24tY29uZm9y
bWFudCBrZXJuZWwtZG9jIGhlYWRlcnMKICBkcm0vYW1kL2FtZGdwdS9hbWRncHVfY3M6IEFkZCBh
IGNvdXBsZSBvZiBtaXNzaW5nIGZ1bmN0aW9uIHBhcmFtCiAgICBkZXNjcmlwdGlvbnMKICBkcm0v
YXJtYWRhL2FybWFkYV9vdmVybGF5OiBTdGF0aWNpZnkgbG9jYWwgZnVuY3Rpb24KICAgICdhcm1h
ZGFfb3ZlcmxheV9kdXBsaWNhdGVfc3RhdGUnCiAgZHJtL3ZjNC92YzRfZGVidWdmczogRGVtb3Rl
IG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MgaGVhZGVycwogIGRybS9yb2NrY2hpcC9kdy1taXBp
LWRzaS1yb2NrY2hpcDogRGVtb3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MKICAgIGhlYWRl
cnMKICBkcm0vcm9ja2NoaXAvcm9ja2NoaXBfcmdiOiBDb25zdW1lIG91ciBvd24gaGVhZGVyCiAg
ZHJtL25vdXZlYXUvbnZrbS9jb3JlL2Zpcm13YXJlOiBGaXggZm9ybWF0dGluZywgcHJvdmlkZSBt
aXNzaW5nIHBhcmFtCiAgICBkZXNjcmlwdGlvbgogIGRybS9yb2NrY2hpcC9yb2NrY2hpcF9sdmRz
OiBGaXggc3RydWN0IGRvY3VtZW50IGZvcm1hdHRpbmcKICBkcm0vZXh5bm9zL2V4eW5vc19kcm1f
Z3NjOiBTdXBwbHkgbWlzc2luZyBkZXNjcmlwdGlvbiBmb3IgJ251bV9saW1pdHMnCiAgZHJtL3N0
aS9zdGlfaGRtaTogTW92ZSAnY29sb3JzcGFjZV9tb2RlX25hbWVzJyBhcnJheSB0byB3aGVyZSBp
dHMgdXNlZAogIGRybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvcjogRml4IGZvcm1hdHRpbmcgYW5k
IHByb3ZpZGUgbWlzc2luZyBtZW1iZXIKICAgIGRlc2NyaXB0aW9uCiAgZHJtL2FtZC9hbWRncHUv
YXRvbWJpb3NfZW5jb2RlcnM6IFJlbW92ZSBzZXQgYnV0IHVudXNlZCB2YXJpYWJsZQogICAgJ2Jh
Y2tsaWdodF9sZXZlbCcKICBkcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsOiBGaXggZm9ybWF0dGlu
ZyBhbmQgcHJvdmlkZSBtaXNzaW5nIG1lbWJlcgogICAgZGVzY3JpcHRpb24KCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgICAgICAgfCAgMiArCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jICAgfCAgNCAtLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMgICAgIHwgMTEgKystLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMgICAgICB8IDEyICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICAgICB8IDYwICsrKysrKysrKystLS0tLS0tLS0KIC4u
Li9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5jb2RlcnMuYyAgICB8ICAzICstCiBkcml2
ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9vdmVybGF5LmMgICAgICAgfCAgMiArLQogLi4uL2dw
dS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfY3J0Yy5jICAgIHwgIDYgKy0KIC4uLi9ncHUv
ZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMgICB8ICA3ICsrLQogZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3M3X2RybV9kZWNvbi5jICAgIHwgIDEgKwogZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2dzYy5jICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX2NvbG9yLmMgICAgIHwgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmwuYyAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL2NvcmUvZmlybXdhcmUuYyAgfCAgOSArLS0KIC4uLi9ncHUvZHJtL3JvY2tjaGlwL2R3
LW1pcGktZHNpLXJvY2tjaGlwLmMgICB8ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
cm9ja2NoaXBfbHZkcy5jICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX3JnYi5jICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2Vf
YmNpLmMgICAgICAgICAgIHwgMTEgLS0tLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5j
ICAgICAgICAgICAgICAgIHwgIDYgKysKIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuaCAg
ICAgICAgICAgICAgICB8ICA2IC0tCiBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYyAgICAg
ICAgICAgICAgICAgfCAgMiArCiBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jICAgICAg
ICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZGVidWdmcy5jICAgICAg
ICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyAgICAgICAgICAg
ICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pX3JlZ3MuaCAgICAgICAg
ICAgfCAgNiArLQogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdjNkLmMgICAgICAgICAgICAgICAg
IHwgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYS5jICAgICAgICAgICAgICAgICB8
ICAyIC0KIGluY2x1ZGUvZHJtL2RybV9hdG9taWMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIDMwIGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQoK
Q2M6IEFqYXkgS3VtYXIgPGFqYXlrdW1hci5yc0BzYW1zdW5nLmNvbT4KQ2M6IEFrc2h1IEFnYXJ3
YWwgPGFrc2h1YUBnbWFpbC5jb20+CkNjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJl
bGxvbmlAYm9vdGxpbi5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogQmVuamFtaW4gR2Fp
Z25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+CkNjOiBCZW4gU2tlZ2dzIDxic2tl
Z2dzQHJlZGhhdC5jb20+CkNjOiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9y
Zz4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzog
Q2hyaXMgWmhvbmcgPHp5d0Byb2NrLWNoaXBzLmNvbT4KQ2M6IENodW4tS3VhbmcgSHUgPGNodW5r
dWFuZy5odUBrZXJuZWwub3JnPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KQ2M6IEV1bmNo
dWwgS2ltIDxjaHVsc3Byby5raW1Ac2Ftc3VuZy5jb20+CkNjOiAiSGVpa28gU3TDvGJuZXIiIDxo
ZWlrb0BzbnRlY2guZGU+CkNjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+CkNjOiBK
ZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0cmFwaGFuZGxlci5jb20+CkNjOiBKZXJvbWUg
R2xpc3NlIDxnbGlzc2VAZnJlZWRlc2t0b3Aub3JnPgpDYzogSmlueW91bmcgSmVvbiA8ankwLmpl
b25Ac2Ftc3VuZy5jb20+CkNjOiBKb29ueW91bmcgU2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5j
b20+CkNjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CkNjOiBLeXVuZ21p
biBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgpDYzogbGluYXJvLW1tLXNpZ0BsaXN0
cy5saW5hcm8ub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6
IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZwpDYzogbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGlu
dXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCkNjOiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1
aWtvdkBhbWQuY29tPgpDYzogTHVkb3ZpYyBEZXNyb2NoZXMgPGx1ZG92aWMuZGVzcm9jaGVzQG1p
Y3JvY2hpcC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgpDYzogTWFyayBZYW8gPG1hcmsueWFvQHJvY2stY2hpcHMuY29tPgpDYzog
TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KQ2M6IE1heGltZSBSaXBh
cmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KQ2M6IE5pY2tleSBZYW5nIDxuaWNrZXkueWFuZ0Byb2Nr
LWNoaXBzLmNvbT4KQ2M6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNv
bT4KQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBQaGlsaXBwIFphYmVsIDxw
LnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogcmVwb3J0IHRvIDx4b3JnLWRyaXZlci1hdGlAbGlz
dHMueC5vcmc+CkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+CkNjOiBSdXNzZWxs
IEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KQ2M6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlwcy5jb20+CkNjOiBTYW5nbWlu
IExlZSA8bHNtaW4ubGVlQHNhbXN1bmcuY29tPgpDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtp
bUBzYW1zdW5nLmNvbT4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+
CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IFZpbmNlbnQg
QWJyaW91IDx2aW5jZW50LmFicmlvdUBzdC5jb20+Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
