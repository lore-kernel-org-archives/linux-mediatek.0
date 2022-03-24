Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7569EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7g8ntlzN5osqkTB8p/p4jn+PkucZbXKwKI+eI4bzd4=; b=3f7aUmQtTXu0a9
	IJuBYTe9w9fWHfLLyE7sTpX/Mtq+w+HugNq7KfjyPcV6FSRkchc264tN2Kz5Sm19EJdW7BnmIIAZn
	BURttykY6UM7YPi9m09ZBFvaMVIMalfYh82DP6AEOpNDemm3hcPGcbYGua8JPc71YOok4C2xihC8h
	AvxTVrzDKbe0K18Mcfr7uNsJMHsRE8qxdc0c+k1OBEXujLqX0iW7YTL/sPxW3oLSsmYJwVPLkh0st
	s5Fk92EVPFy1S0xvs6RJeXWdYS3E4Ac7XG48aSl/r7sgDGMCxnX5fRUy6atIHCU7jK4inw0jmWBCm
	S0+/MH5QLs73V/mCb2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXNTh-00GhnP-Os; Thu, 24 Mar 2022 13:26:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXNTW-00Ghkz-6r; Thu, 24 Mar 2022 13:26:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27E5E60F1E;
 Thu, 24 Mar 2022 13:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B397C340EC;
 Thu, 24 Mar 2022 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648128360;
 bh=fyIiU5RZ5vQvJ0AbYHjhGoBAWCrDkNOaT9PweDfIA54=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q5jVk0jR0N8AxYnAmlI/4hn9WXOJoqruiN3Lx4o5Q7LvZ7+QE7Os06E+7SSbr55jK
 AjNuwfG++wDfE+/s3NDSLIJfCb+2ktBuloavqEAmw7YphDTda4uOxn/oUPRqlu3F7Y
 orG4xR6LpBhXMERtPv8WWxtisu3krU/p0+bIGgbdXdFvuCJ+l8GR5tqTZPIiqs+ULD
 +y7kI2iUuz8DojIZ7dmk7HgWETysRWE2svWhvxRZbDT8j9gytgcGh/0zCfZo7YUzm2
 OIo0ksBhURzjt2b+H3GembODH1Q6MzPFgeBgAHPHiNXydBJoiKybaVS25qDAJ/AgyH
 izJ/bVYB21G0w==
Received: by mail-ej1-f44.google.com with SMTP id lr4so713181ejb.11;
 Thu, 24 Mar 2022 06:26:00 -0700 (PDT)
X-Gm-Message-State: AOAM533Qeqr9c7WwdWROJ/eIHaauuI0u1lYbc/EorZexrjDdlxCoF85R
 eCAVOk42/PS+6crMt90fToQuIXxJzVywTjoI9w==
X-Google-Smtp-Source: ABdhPJxMtishIXyQnHytEurL58PXSNq0mjIOLyhlOsXwq+vbDhHOyF+FHGCUAHZ5No9IqBKpjNCuQP5Pnh/dbKKnyGA=
X-Received: by 2002:a17:906:79c4:b0:6cf:5489:da57 with SMTP id
 m4-20020a17090679c400b006cf5489da57mr5757085ejo.48.1648128358773; Thu, 24 Mar
 2022 06:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+=hTKTjB8rR77_uQYKDWHzLyTdeU7zbixSCZCNrdmNvg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+=hTKTjB8rR77_uQYKDWHzLyTdeU7zbixSCZCNrdmNvg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 24 Mar 2022 21:25:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY__kzL8YuGo-oKct4c_bL-Ch5rW8wBpkhOXkK+a10gNXVg@mail.gmail.com>
Message-ID: <CAAOTY__kzL8YuGo-oKct4c_bL-Ch5rW8wBpkhOXkK+a10gNXVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Fix MediaTek display dt-bindings issues
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_062602_376188_6056CC6E 
X-CRM114-Status: GOOD (  18.85  )
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
Cc: DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFJvYjoKClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIy5bm0M+aciDIz
5pelIOmAseS4iSDkuIvljYgxMDoxMOWvq+mBk++8mgo+Cj4gT24gV2VkLCBNYXIgOSwgMjAyMiBh
dCA3OjQ3IEFNIGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gVGhlIHZkb3N5czAgc2VyaWVzIGNhcnJpZWQgYSBuaWNlIGR0LWJpbmRpbmdzIGNv
bnZlcnNpb24gb2YgdGhlIG9sZAo+ID4gdHh0IGRvY3VtZW50YXRpb24gZm9yIHRoZSBlbnRpcmUg
bWVkaWF0ZWstZHJtIGRyaXZlciwgYnV0IHNvbWUgb2YKPiA+IHRoZSBpc3N1ZXMgaW4gdGhlcmUg
d2VyZW4ndCBzZWVuLgo+ID4KPiA+IFRoaXMgc2VyaWVzIGlzIGZpeGluZyBhbGwgb2YgdGhlIGlz
c3VlcyBwb2ludGVkIG91dCBieSBhCj4gPiBgZHRfYmluZGluZ19jaGVja2AgcnVuLCBmb2xsb3dl
ZCBieSBgZHRic19jaGVja2AuCj4gPgo+ID4gQ2hhbmdlIGluIHYyOgo+ID4gLSByZW1vdmUgbWVk
aWF0ZWssZXRoZHIueWFtbCBmaWxlCj4gPiAtIGNoYW5nZSBpbmNsdWRlIGhlYWRlciBvZiBtZWRp
YXRlayxvdmwtMmwueWFtbCBmcm9tIG10ODE3MyB0byBtdDgxODMKPiA+Cj4gPiBBbmdlbG9HaW9h
Y2NoaW5vIERlbCBSZWdubyAoMyk6Cj4gPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRl
aywgbXV0ZXg6IEZpeCBtZWRpYXRlaywgZ2NlLWV2ZW50cyB0eXBlCj4gPiAgIGR0LWJpbmRpbmdz
OiBkaXNwbGF5OiBtZWRpYXRlaywgb3ZsOiBGaXggJ2lvbW11JyByZXF1aXJlZCBwcm9wZXJ0eQo+
ID4gICAgIHR5cG8KPiA+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBGaXggZXhh
bXBsZXMgb24gbmV3IGJpbmRpbmdzCj4gPgo+ID4gamFzb24tamgubGluICgxKToKPiA+ICAgUmV2
ZXJ0ICJkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IGFkZCBldGhkciBkZWZpbml0aW9u
IGZvcgo+ID4gICAgIG10ODE5NSIKPgo+IENhbiB0aGlzIHNlcmllcyBnZXQgYXBwbGllZCBzb29u
PyBsaW51eC1uZXh0IGlzIHN0aWxsIGJyb2tlbi4KPgo+IElmIGl0IGhpdHMgTGludXMnIHRyZWUs
IEkgd2lsbCBiZSBhcHBseWluZyB0aGVtLgoKSSd2ZSBhcHBsaWVkIHRoaXMgc2VyaWVzIHRvIG15
IHRyZWUgWzFdLCBidXQgbm93IGlzIG1lcmdlIHdpbmRvdywgc28gSQpwbGFuIHRvIHNlbmQgdGhp
cyBzZXJpZXMgdGhyb3VnaCBEYXZlJ3MgdHJlZSBhZnRlciA1LjE4LXJjMS4gV291bGQKdGhpcyBi
ZSB0b28gbGF0ZSBmb3IgeW91PwoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRy
bS1maXhlcwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBSb2IKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
