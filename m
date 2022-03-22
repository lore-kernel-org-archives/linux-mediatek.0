Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B697C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IWVlnWbZaPX/4bng2pCRtOYNZ4cYiDBPwgHR5Qe3gg=; b=seZ6701QE4w82W
	G4iEXk+lAtwhOTN+qGi2Bb38Iy4HFRQxOYbI9xXnbJgHsdZTrbMwE1AnraHfka5bx/N+qAy+VwPBK
	dxZ2xSYkzdiopCzzSEDHqszDP9XC+f+JsDhAS+0Nz47WHAmHLtU0BhtWSzljlFURAQ4QsffSqJgBN
	pBs6bwRFI4DaMKkS6Sipw/HT8Tp/jxIM4LU5R02kjuXW4GQox9ql3nSn+Jy4fAH/1sSuMk6ksRVPc
	GIVlf631Y5YyOdfNEe4wfedVfNOiBoPcvmGbJ5Da6Jx0HwHuJI/qGts5gwdEnJMqq6sWJ0KsjiX8I
	7YXWXvmVkx6c3NmJjilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWgA6-00BUth-Ej; Tue, 22 Mar 2022 15:11:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWg9o-00BUj6-4b; Tue, 22 Mar 2022 15:10:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41AB9B81D13;
 Tue, 22 Mar 2022 15:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20FEC340ED;
 Tue, 22 Mar 2022 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647961845;
 bh=iD3r2C8ohus5StZzu+HIHENCtSsyhMruFFh9RM7/ok0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lTfrr6Xx5T7dbCIZGWoVSA4ezDO8SPB4V6YiBOHileBU/8ywOv7AWeMUKIdBFO6mz
 MvY51MObY0A/m/xTXiyLMLUAPYZ6+actWLn4LlYJqH3g/L4jHHzy1wCWg70oZIXspZ
 U6x970s8lT3VvnYOpTRHlqx2tDKXxKQ8DwacUVkUrJ627HzygQZjwNdf37sragLX6I
 bv5f/jPoJ3qdHmRLPmHthWGXr32polEsPw4OQWIeCq8MGYMWb/SYtKycLUnFl/f0w3
 gU4qi+iDUfcOw13fViapVaP64M1Fj7vJK1yygwrMI30M63p4q3O58w9LVF3z2np3Le
 yUcdLHGQehvQQ==
Received: by mail-ej1-f49.google.com with SMTP id bi12so36913982ejb.3;
 Tue, 22 Mar 2022 08:10:44 -0700 (PDT)
X-Gm-Message-State: AOAM532QS46lavK3WrWxEiIVJX/SiwynnppTPj1EjLJdxh6W5U0NP/CE
 PX4WYDzEchK0lecp58CrLEC43slr1w7V+qDIgQ==
X-Google-Smtp-Source: ABdhPJwcstYlhae/VDeErmYlaX8hBZSodjccbiEArN1YhP3mCzfkMUHmbq6+FoN7ayATI+AtiuwrK2GB7QQaqZOLugM=
X-Received: by 2002:a17:907:97c9:b0:6db:ab53:1fdf with SMTP id
 js9-20020a17090797c900b006dbab531fdfmr26610884ejc.406.1647961843159; Tue, 22
 Mar 2022 08:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220317143926.15835-1-moudy.ho@mediatek.com>
 <20220317143926.15835-4-moudy.ho@mediatek.com>
 <Yjj8CanzmdHeX7qz@robh.at.kernel.org>
In-Reply-To: <Yjj8CanzmdHeX7qz@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 22 Mar 2022 23:10:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-nTojmt44ts2VtXU3_kNpbn=CniHJh8dDeM0bPj8ouRA@mail.gmail.com>
Message-ID: <CAAOTY_-nTojmt44ts2VtXU3_kNpbn=CniHJh8dDeM0bPj8ouRA@mail.gmail.com>
Subject: Re: [PATCH v14 3/6] dt-bindings: soc: mediatek: move out common
 module from display folder
To: Rob Herring <robh@kernel.org>
Cc: Moudy Ho <moudy.ho@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>, river.cheng@mediatek.com, 
 linux-kernel <linux-kernel@vger.kernel.org>, roy-cw.yeh@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, 
 Pi-Hsun Shih <pihsun@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, DTML <devicetree@vger.kernel.org>, 
 Hsin-Yi Wang <hsinyi@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 daoyuan huang <daoyuan.huang@mediatek.com>, randy.wu@mediatek.com, 
 Geert Uytterhoeven <geert+renesas@glider.be>, allen-kh.cheng@mediatek.com, 
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Nicolas Boichat <drinkcat@chromium.org>, menghui.lin@mediatek.com, 
 Alexandre Courbot <acourbot@chromium.org>, Rob Landley <rob@landley.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_081048_556479_0B544910 
X-CRM114-Status: GOOD (  12.85  )
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

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjLlubQz5pyIMjLml6Ug6YCx5LqM
IOS4iuWNiDY6Mjjlr6vpgZPvvJoKPgo+IE9uIFRodSwgMTcgTWFyIDIwMjIgMjI6Mzk6MjMgKzA4
MDAsIE1vdWR5IEhvIHdyb3RlOgo+ID4gSW4gb3JkZXIgdG8gc2hhcmUgdGhlIHNhbWUgaGFyZHdh
cmUgaW5mb3JtYXRpb24gd2l0aCBNRFAzLAo+ID4gY2hhbmdlIHRoZSBNVVRFWCBkdC1iaW5kaW5n
IHRvIHRoZSBwYXRoICJzb2MvbWVkaWF0ZWsiLgoKQWNrZWQtYnk6IENodW4tS3VhbmcgSHUgPGNo
dW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNb3VkeSBIbyA8
bW91ZHkuaG9AbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL3tkaXNwbGF5
ID0+IHNvY30vbWVkaWF0ZWsvbWVkaWF0ZWssbXV0ZXgueWFtbCAgICAgIHwgMiArLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gIHJlbmFtZSBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mve2Rpc3BsYXkgPT4gc29jfS9tZWRpYXRl
ay9tZWRpYXRlayxtdXRleC55YW1sICg5NyUpCj4gPgo+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
