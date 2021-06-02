Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EF1C47092
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 14:33:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF37A613D8
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 14:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF37A613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t9RUN7/lkfkGSTEgwnyqWGdEdKHtCNtmbciRxVLN1bo=; b=T9xXgzUb/ib8DU
	otP90qXNZdY3W7jYzkiaqgCI/IS+JO8hs1rIe0Dkl7g+VMRuOfZ/dtuqcaNrLixsHIqZkcBY3Yqf+
	6D0f0YkoNAofGKHAkFlGNBOFGtOSIBlV/ylaWDeBchzgSzdq9rsD/S+zZPbU+kTJGlH5KNSQdnRJr
	9rAtgDzmFXkyo/4Sh2BzN7AbSDn7DFTHojaPb6R/zQV56I9hXNg3B7NIjUAqRXJaY2iwdxFlQvvb/
	+/FbaPiOr0eaXcKldj2kZe94AZ9BXHZWO2luke4wJfHzCPrsl0wNd4XmZtD+tIlJsR7uhW+QD82KG
	s7UR2GCuXoCqVEaNLX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loRvo-004Zw9-Ox; Wed, 02 Jun 2021 14:33:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loRvj-004ZtU-NC
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 14:33:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso3915375wmh.4
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Jun 2021 07:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hexu7cKSeKzuwDGfSYjJ5Naq4syeodeMqWoX460WR6c=;
 b=YnUg9R7FAfDth6b0+i7LnprXoGOHmxfpsGVrwM1uR4qc3ylGDcN2fMm7g5Cw2B/cIW
 j30w+lYL/AREtK2OKb6Mpkh+UhMcDOqEW8PseOYarGU/zP/skxG0FKrFJ0rR1Zs6txh8
 5+8n+muAZdpofmyn1MIYZF5LmLJvIhct3uXEcUaKJfZq0a6R+yt4uSJuh8vvcT+wLdbZ
 GmfEoZH5U46rZrJkBqJWpH87XABFe/4GcwKakQj6Sjpv/7rIFKu+YxANUoRR6Jxmo3RT
 kUj/s0mLMiLiZ+uLUu1nFREt38x9aoB2pic1i2duhXYWl2LDDriXoDDCyZGQ/7coEEoi
 NO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hexu7cKSeKzuwDGfSYjJ5Naq4syeodeMqWoX460WR6c=;
 b=SSc9l787uNT2v2yTrIt1vdm2Isr1Exzn1QE/sTFrgDUybW8waCIfMsNCEOhEm6DFHy
 lzOUzg6btMddUPmAbob04TwePVyaG7MTzyDym2/IoJmX8zQpLw5HpV2+wliM8Ragpk5V
 IbS61g78DzdPPs87CQB+vW6ZnxxZ+B9zhUezc58Yc7EeqvS+3povhUPgZh5zcLFRUCXl
 EeX8yTEZOtpkys//uuRSTwr06oXvpZYFAAd0LNTvcdihFfk5ioSaULk5i1P7L4iVh08h
 YID4ExtDwECGMCqTVPO/eXQcmSQgkPLJP8kIHlfxoCe3WNPg9xVymmQa96UEd7uGSvkw
 QyZQ==
X-Gm-Message-State: AOAM530uyqOvW4r1u6XDngqNoH4yTtxvpP1dTkGsFKoNYIw1/6oNwrJA
 3UTscNCW72XPQeR8TBmnRmk50Q==
X-Google-Smtp-Source: ABdhPJwH8/eJTRs27ADnedTTW55aDfi99/T9FH9EumVjgB06SEnGQcD9JLwfnOw2xFcXpsN5fAwH9w==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id
 l18mr31968202wmc.142.1622644389928; 
 Wed, 02 Jun 2021 07:33:09 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Adam Jackson <ajax@redhat.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agarwal <akshua@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, Ben Widawsky <ben@bwidawsk.net>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>, Fabien Dessenne <fabien.dessenne@st.com>,
 freedreno@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Rossi <issor.oruam@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, nouveau@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Stephen Boyd <swboyd@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>
Subject: [RESEND 00/26] Rid W=1 warnings from GPU
Date: Wed,  2 Jun 2021 15:32:34 +0100
Message-Id: <20210602143300.2330146-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_073311_838262_6BC7EB3C 
X-CRM114-Status: GOOD (  12.69  )
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

U29tZSBvZmYgdGhlc2UgcGF0Y2hlcyBoYXZlIGJlZW4ga25vY2tpbmcgYXJvdW5kIGZvciBhIHdo
aWxlLgoKV2hvIHdpbGwgaG9vdmVyIHRoZW0gdXAgcGxlYXNlPwoKVGhpcyBzZXQgaXMgcGFydCBv
ZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBjbGVhbi11cCBXPTEKa2VybmVsIGJ1aWxk
cywgd2hpY2ggYXJlIGN1cnJlbnRseSBvdmVyd2hlbG1pbmdseSByaWRkbGVkIHdpdGgKbmlnZ2x5
IGxpdHRsZSB3YXJuaW5ncy4KCkxlZSBKb25lcyAoMjYpOgogIGRybS9tZWRpYXRlay9tdGtfZGlz
cF9jb2xvcjogU3RyaXAgaW5jb3JyZWN0IGRvYyBhbmQgZGVtb3RlIGhlYWRlcgogIGRybS9tZWRp
YXRlay9tdGtfZGlzcF9nYW1tYTogU3RyaXAgYW5kIGRlbW90ZSBub24tY29uZm9ybWFudAogICAg
a2VybmVsLWRvYyBoZWFkZXIKICBkcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsOiBTdHJpcCBhbmQg
ZGVtb3RlIG5vbi1jb25mb3JtYW50IGhlYWRlcgogIGRybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1h
OiBTdHJpcCBhbmQgZGVtb3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MKICAgIGhlYWRlcgog
IGRybS9zdGkvc3RpX2hkbWlfdHgzZzRjMjhwaHk6IFByb3ZpZGUgZnVuY3Rpb24gbmFtZXMgZm9y
IGtlcm5lbC1kb2MKICAgIGhlYWRlcnMKICBkcm0vc3RpL3N0aV9oZGE6IFByb3ZpZGUgbWlzc2lu
ZyBmdW5jdGlvbiBuYW1lcwogIGRybS9zdGkvc3RpX3R2b3V0OiBQcm92aWRlIGEgYnVuY2ggb2Yg
bWlzc2luZyBmdW5jdGlvbiBuYW1lcwogIGRybS9zdGkvc3RpX2hxdmRwOiBGaXggaW5jb3JyZWN0
bHkgbmFtZWQgZnVuY3Rpb24gJ3N0aV9ocXZkcF92dGdfY2IoKScKICBkcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfZW5jb2Rlcl9waHlzX2NtZDogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZQogICAgJ2NtZF9l
bmMnCiAgZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2ludGVycnVwdHM6IERlbW90ZSBhIGJ1bmNo
IG9mIGtlcm5lbC1kb2MKICAgIGFidXNlcwogIGRybS9tc20vZGlzcC9kcHUxL2RwdV9wbGFuZTog
Rml4IGEgY291cGxlIG9mIG5hbWluZyBpc3N1ZXMKICBkcm0vbXNtL21zbV9nZW06IERlbW90ZSBr
ZXJuZWwtZG9jIGFidXNlcwogIGRybS9tc20vZHAvZHBfY2F0YWxvZzogQ29ycmVjdGx5IGRvY3Vt
ZW50IHBhcmFtICdkcF9jYXRhbG9nJwogIGRybS9tc20vZHAvZHBfbGluazogRml4IHNvbWUgcG90
ZW50aWFsIGRvYy1yb3QKICBkcm0vbm91dmVhdS9udmttL3N1YmRldi9tYy90dTEwMjogTWFrZSBm
dW5jdGlvbnMgY2FsbGVkIGJ5IHJlZmVyZW5jZQogICAgc3RhdGljCiAgZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2VfdHJhbnNmb3JtOiBSZW1vdmUgc3VwZXJmbHVvdXMKICAgIHJlLWluaXRpYWxp
c2F0aW9uIG9mIERDRkVfTUVNX0xJR0hUX1NMRUVQX0NOVEwsCiAgZHJtL3hsbngvenlucW1wX2Rp
c3A6IEZpeCBpbmNvcnJlY3RseSBuYW1lZCBlbnVtCiAgICAnenlucW1wX2Rpc3BfbGF5ZXJfaWQn
CiAgZHJtL3hsbngvenlucW1wX2RwOiBGaXggaW5jb3JyZWN0bHkgbmFtZSBmdW5jdGlvbiAnenlu
cW1wX2RwX3RyYWluKCknCiAgZHJtL3R0bS90dG1fdHQ6IERlbW90ZSBub24tY29uZm9ybWFudCBr
ZXJuZWwtZG9jIGhlYWRlcgogIGRybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVl
bjogRGVtb3RlIGtlcm5lbC1kb2MgYWJ1c2UKICBkcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3
NzAxOiBEZW1vdGUga2VybmVsLWRvYyBhYnVzZQogIGRybS92Z2VtL3ZnZW1fZHJ2OiBTdGFuZGFy
ZCBjb21tZW50IGJsb2NrcyBzaG91bGQgbm90IHVzZSBrZXJuZWwtZG9jCiAgICBmb3JtYXQKICBk
cm0vZXh5bm9zL2V4eW5vczdfZHJtX2RlY29uOiBGaXggaW5jb3JyZWN0IG5hbWluZyBvZgogICAg
J2RlY29uX3NoYWRvd19wcm90ZWN0X3dpbigpJwogIGRybS9leHlub3MvZXh5bm9zX2RybV9pcHA6
IEZpeCBkb2N1bWVudGF0aW9uIGZvcgogICAgJ2V4eW5vc19kcm1faXBwX2dldF97Y2FwcyxyZXN9
X2lvY3RsKCknCiAgZHJtL3Zib3h2aWRlby9oZ3NtaV9iYXNlOiBQbGFjZSBmdW5jdGlvbiBuYW1l
cyBpbnRvIGhlYWRlcnMKICBkcm0vdmJveHZpZGVvL21vZGVzZXR0aW5nOiBQcm92aWRlIGZ1bmN0
aW9uIG5hbWVzIGZvciBwcm90b3R5cGUKICAgIGhlYWRlcnMKCiAuLi4vZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2VfdHJhbnNmb3JtLmggICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3M3X2RybV9kZWNvbi5jICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9pcHAuYyAgICAgICB8ICA0ICstLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX2NvbG9yLmMgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9nYW1tYS5jICAgICB8ICA0ICstLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX292bC5jICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9yZG1hLmMgICAgICB8ICA0ICstLQogLi4uL2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNv
ZGVyX3BoeXNfY21kLmMgIHwgIDQgLS0tCiAuLi4vZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9o
d19pbnRlcnJ1cHRzLmMgfCAzMiArKysrKysrKystLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfcGxhbmUuYyAgICAgfCAgNCArLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfY2F0YWxvZy5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbXNt
L2RwL2RwX2xpbmsuYyAgICAgICAgICAgICAgfCAgNiArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9nZW0uYyAgICAgICAgICAgICAgICAgfCAgNCArLS0KIC4uLi9ncHUvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvbWMvdHUxMDIuYyAgICB8ICA2ICsrLS0KIC4uLi9kcm0vcGFuZWwvcGFuZWwt
cmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYyB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2l0cm9uaXgtc3Q3NzAxLmMgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlf
aGRhLmMgICAgICAgICAgICAgICAgIHwgIDYgKystLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlf
aGRtaV90eDNnNGMyOHBoeS5jICAgIHwgIDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9o
cXZkcC5jICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfdHZv
dXQuYyAgICAgICAgICAgICAgIHwgMTggKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3R0LmMgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZp
ZGVvL2hnc21pX2Jhc2UuYyAgICAgICAgfCAxOSArKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJt
L3Zib3h2aWRlby9tb2Rlc2V0dGluZy5jICAgICAgIHwgMjAgKysrKysrKy0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9n
cHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYyAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS94bG54L3p5bnFtcF9kcC5jICAgICAgICAgICAgICB8ICAyICstCiAyNiBmaWxlcyBjaGFu
Z2VkLCA4MCBpbnNlcnRpb25zKCspLCA4MiBkZWxldGlvbnMoLSkKCkNjOiBBZGFtIEphY2tzb24g
PGFqYXhAcmVkaGF0LmNvbT4KQ2M6IEFqYXkgS3VtYXIgPGFqYXlrdW1hci5yc0BzYW1zdW5nLmNv
bT4KQ2M6IEFrc2h1IEFnYXJ3YWwgPGFrc2h1YUBnbWFpbC5jb20+CkNjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiBBbGlzdGFpciBQb3BwbGUgPGFwb3BwbGVA
bnZpZGlhLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bzb21haW5saW5l
Lm9yZz4KQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3Jn
PgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogQmVuIFdpZGF3c2t5IDxi
ZW5AYndpZGF3c2submV0PgpDYzogQ2hhbmRhbiBVZGRhcmFqdSA8Y2hhbmRhbnVAY29kZWF1cm9y
YS5vcmc+CkNjOiBDaHJpc3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNj
OiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0
Lm5ldD4KQ2M6IEZhYmllbiBEZXNzZW5uZSA8ZmFiaWVuLmRlc3Nlbm5lQHN0LmNvbT4KQ2M6IGZy
ZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRl
QHJlZGhhdC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4K
Q2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+CkNjOiBIeXVuIEt3b24gPGh5dW4ua3dv
bkB4aWxpbnguY29tPgpDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgpDYzogSmFn
YW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBKb29ueW91bmcgU2hpbSA8
ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+CkNjOiBLcmlzaG5hIE1hbmlrYW5kYW4gPG1rcmlzaG5A
Y29kZWF1cm9yYS5vcmc+CkNjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93
c2tpQGNhbm9uaWNhbC5jb20+CkNjOiBLdW9nZWUgSHNpZWggPGtoc2llaEBjb2RlYXVyb3JhLm9y
Zz4KQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+CkNjOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBMZW8g
TGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9y
ZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1hcm0t
bXNtQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2
Z2VyLmtlcm5lbC5vcmcKQ2M6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5n
LmNvbT4KQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+CkNjOiBN
YXVybyBSb3NzaSA8aXNzb3Iub3J1YW1AZ21haWwuY29tPgpDYzogTWljaGFsIFNpbWVrIDxtaWNo
YWwuc2ltZWtAeGlsaW54LmNvbT4KQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogUm9iIENsYXJrIDxy
b2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpD
YzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBTZXVuZy1Xb28gS2ltIDxzdzAzMTIu
a2ltQHNhbXN1bmcuY29tPgpDYzogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPgpD
YzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IFRoaWVycnkgUmVk
aW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBWaW5jZW50IEFicmlvdSA8dmluY2Vu
dC5hYnJpb3VAc3QuY29tPgotLSAKMi4zMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
