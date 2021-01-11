Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95E6C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 23:40:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EE322D0B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 23:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61EE322D0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1JtweMBVq62aqc1rbjV3Yn3lOJVualkxtbfkHXq0pU0=; b=rGrujJLFQH7FlCYXBGgfCR6KA
	3cGe6QoLzY2NnjQZXejZcRoJwSq5TgHxpkU1G6TSmo8PqZhUpW9IPGNn592b5jydI6gfi0gBQnc1q
	c8Y1w+Oqzqb467FTL+03KkxZS7t0C3luwBI2paqSQ4o0mrWmZlGk2gz+/v8t/xZGC2SzVoppIkO8Q
	zM3hO/CNBogzKZwSwoa1EAolgXpbcPpaiy63IFQi3nl7CD1jBDu5hqQALEVhYPzrTrLJT6dOMto+O
	dOWz9al5U/6Twc3lBbgZb+2fyOJwC/tfL9huT/exkwMoWlFcjuM8OgpOsxU8DINlhK8qp3AszRfen
	Viy7MrwLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz6nC-0000Wb-JD; Mon, 11 Jan 2021 23:40:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz6n3-0000TP-Ss; Mon, 11 Jan 2021 23:40:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DACF222D0B;
 Mon, 11 Jan 2021 23:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610408401;
 bh=SUTe1YRrwFqH+vKzLDa3Og8DsDF1ZslKpsxpjuqS79Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C4SRUzfgdqbPO9+4zUA34idzVN/yden/m5HsHWYfd+XTYEC++Ui3SBEj9nck9hOfE
 liCL2d1S7L9webHpS/jmoyOYZmy8YXGdkpcwsluC+HdaXv1tARWHsI+obIHm43W25g
 01vJ5Ja8Utn61uvTSuBj7VYppOyrWA5/YFeuZn/LY16G1cYgXAjC5K7iIeG6QA1gI1
 sXRDVQ+Tr8x2KfPkY8zCHFu6Rq2a3Y+bhjlMM9mZN36UMh23iDBG2lqkni4bZkEzun
 fWv/hmKidkno64/wf8cgGW1mU/9gbiUw4xrRlduZO+cQSAxU+qObUIgzyezXiW3O7f
 s81LcVzYZWBNw==
Received: by mail-ej1-f42.google.com with SMTP id n26so862592eju.6;
 Mon, 11 Jan 2021 15:40:00 -0800 (PST)
X-Gm-Message-State: AOAM530Vhh73VdcQphEgoLb/9T/cWCPIn2LTCjelR/rcjpsAq1lqnn1s
 Hmm2yslnQzP7oCMkO7aW+r2sQFqPEpLYvTrp6w==
X-Google-Smtp-Source: ABdhPJy3eFEmLOMrjiND05dS8vMTb4vPOL8mvRHpetE+fXbs9sEJc5/Jr5lXrVgBYYr+sVlxdWA4fZ74fE5DQFk/WR4=
X-Received: by 2002:a17:906:3753:: with SMTP id
 e19mr1211701ejc.267.1610408399484; 
 Mon, 11 Jan 2021 15:39:59 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 07:39:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_91MUXgQg3zF=4Cjb4xAW+FKKXQKGSGE0YsTgO855_LiQ@mail.gmail.com>
Message-ID: <CAAOTY_91MUXgQg3zF=4Cjb4xAW+FKKXQKGSGE0YsTgO855_LiQ@mail.gmail.com>
Subject: Re: [PATCH v3, 02/15] dt-bindings: mediatek: add description for
 mt8192 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_184002_095766_09668B75 
X-CRM114-Status: GOOD (  17.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0OOWvq+mBk++8mgo+Cj4gYWRk
IGRlc2NyaXB0aW9uIGZvciBtdDgxOTIgZGlzcGxheQoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0t
bmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0t
bmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcg
Tml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxk
aXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggOWQ5YWI2NS4uYjQ3ZTFhMCAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gQEAgLTQ0LDcgKzQ0LDcgQEAg
UmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6Cj4gICAgICAgICAibWVk
aWF0ZWssPGNoaXA+LWRwaSIgICAgICAgICAgICAgICAgICAgLSBEUEkgY29udHJvbGxlciwgc2Vl
IG1lZGlhdGVrLGRwaS50eHQKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tdXRleCIg
ICAgICAgICAgICAtIGRpc3BsYXkgbXV0ZXgKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlz
cC1vZCIgICAgICAgICAgICAgICAtIG92ZXJkcml2ZQo+IC0gIHRoZSBzdXBwb3J0ZWQgY2hpcHMg
YXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10ODE2NywgbXQ4MTczIGFuZCBtdDgxODMuCj4g
KyAgdGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10MjcxMiwgbXQ4MTY3
LCBtdDgxNzMsIG10ODE4MyBhbmQgbXQ4MTkyLgo+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRy
ZXNzIGFuZCBsZW5ndGggb2YgdGhlIGZ1bmN0aW9uIGJsb2NrIHJlZ2lzdGVyIHNwYWNlCj4gIC0g
aW50ZXJydXB0czogVGhlIGludGVycnVwdCBzaWduYWwgZnJvbSB0aGUgZnVuY3Rpb24gYmxvY2sg
KHJlcXVpcmVkLCBleGNlcHQgZm9yCj4gICAgbWVyZ2UgYW5kIHNwbGl0IGZ1bmN0aW9uIGJsb2Nr
cykuCj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
