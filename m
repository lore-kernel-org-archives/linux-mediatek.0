Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NE0yE6SJXnpdKSzQR4xmEDt+AYe12SwlJ9AeTJNLLjI=; b=gjMDLG07YPuoGD
	zSwVL59Mzj0zlOJ2IyZi0Yv99bfofAN2Qlvzp+487Bz4qFJvNous1x3hCeElPF/8pF2gXloMVx6yh
	15lZQiifWDV7SmEbXc2yyisQSHpgeuA7vKGWBoHGNwP1JM4qS4PoO8X21EYASOMLtm8Da4DYpaw4c
	Jb2iAkquVUuvMDx/kjUVUQMmefDgTK6F0pz+s7B5rjDbzTSxyRAp28FZZjn+dLhJApibBPP39mW3E
	zNdPCPsWQljhCPDR/SemD2gxrWMiw6BTWKH0Tooo/PRiKZfG/kMdk6oZEL/Rsuzr4VGq9zC0qWQDs
	seu245A4XwoNhF3b2VEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDU08-002x2c-Mz; Fri, 28 Jan 2022 16:21:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDTxz-002w8s-U3; Fri, 28 Jan 2022 16:19:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5287461F0B;
 Fri, 28 Jan 2022 16:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E2AC340EF;
 Fri, 28 Jan 2022 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643386754;
 bh=fD5y5+RxVxJbAjwnRL0Gcjwy+JCQgKkKiJKWB/hr9ZE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pLdiMamXFvznn4sfU/OlT6PQxSNkbq+I43t+cnGnSl7rkHbBeeBrS4xj5vw5Wwier
 ibfbYtHEtY571/HHJfN5HYd1lYYQCy0xeeBHSHv3oJ02Xb9RfGwXEVnNij4EVuCjIA
 VMD/Qymv6iZSHwLAQn17GO/tVfVeYZxDhRvjraH7Oorby/URhtViJzsCzZfsyUkZk/
 WXVK267uhRyS018W5FNSQwgipjO7fFvLZgnQcnmwfpXhiOzebPUK35NKyyyBIPh6oW
 3waTT2LyyiVQ1xhjTasJt5hBl3prjkaTvsgk0djjvr0Q/xSWeuslNX+ITRPx1NFx/m
 f3YEZLInNlHew==
Received: by mail-ej1-f43.google.com with SMTP id s13so17709955ejy.3;
 Fri, 28 Jan 2022 08:19:14 -0800 (PST)
X-Gm-Message-State: AOAM532TSQNKTdQYRlnnm/WtrI9eSOJLT9W/1Xvh1cY5j+/udK0Cn+aC
 XGXx38AieDRabAnw9ISJVmal6JQ/uR08RCG+KA==
X-Google-Smtp-Source: ABdhPJzaVNhN4Lp5kRT0pDrdXP2bqgeUBcLYAhm9wcVbdADCPGfdi9izUodQ5zDtyd7TY5wC8q/EJOif3CkwqnT/Bp0=
X-Received: by 2002:a17:907:a089:: with SMTP id
 hu9mr7617781ejc.680.1643386752416; 
 Fri, 28 Jan 2022 08:19:12 -0800 (PST)
MIME-Version: 1.0
References: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
 <20220128120718.30545-5-yongqiang.niu@mediatek.com>
In-Reply-To: <20220128120718.30545-5-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 29 Jan 2022 00:19:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8uF1TY9TsP3wUW6gw9M21F9Op9wRc9GDX7edbSa8sQeQ@mail.gmail.com>
Message-ID: <CAAOTY_8uF1TY9TsP3wUW6gw9M21F9Op9wRc9GDX7edbSa8sQeQ@mail.gmail.com>
Subject: Re: [PATCH v1, 4/4] drm/mediatek: add mt8186 display support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_081916_086218_875D1A2A 
X-CRM114-Status: GOOD (  15.43  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMuW5tDHmnIgyOOaXpSDpgLHkupQg5LiL5Y2IODowN+Wvq+mBk++8mgo+Cj4gU2ln
bmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMzkgKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gaW5kZXggNmVmYjQyM2Nj
YzkyLi43NTRiMWJlMjVkMGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuYwo+IEBAIC0xNTgsNiArMTU4LDI0IEBAIHN0YXRpYyBjb25zdCBlbnVtIG10a19kZHBfY29t
cF9pZCBtdDgxODNfbXRrX2RkcF9leHRbXSA9IHsKPiAgICAgICAgIEREUF9DT01QT05FTlRfRFBJ
MCwKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQgbXQ4MTg2X210
a19kZHBfbWFpbltdID0gewo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkwwLAo+ICsgICAgICAg
RERQX0NPTVBPTkVOVF9SRE1BMCwKPiArICAgICAgIEREUF9DT01QT05FTlRfQ09MT1IwLAo+ICsg
ICAgICAgRERQX0NPTVBPTkVOVF9DQ09SUiwKPiArICAgICAgIEREUF9DT01QT05FTlRfQUFMMCwK
PiArICAgICAgIEREUF9DT01QT05FTlRfR0FNTUEsCj4gKyAgICAgICBERFBfQ09NUE9ORU5UX1BP
U1RNQVNLMCwKPiArICAgICAgIEREUF9DT01QT05FTlRfRElUSEVSLAo+ICsgICAgICAgRERQX0NP
TVBPTkVOVF9EU0kwLAo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IGVudW0gbXRrX2RkcF9jb21w
X2lkIG10ODE4Nl9tdGtfZGRwX2V4dFtdID0gewo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkxf
MkwwLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9SRE1BMSwKPiArICAgICAgIEREUF9DT01QT05F
TlRfRFBJMCwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBlbnVtIG10a19kZHBfY29tcF9pZCBt
dDgxOTJfbXRrX2RkcF9tYWluW10gPSB7Cj4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTDAsCj4g
ICAgICAgICBERFBfQ09NUE9ORU5UX09WTF8yTDAsCj4gQEAgLTIyMSw2ICsyMzksMTMgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGEgbXQ4MTgzX21tc3lzX2RyaXZl
cl9kYXRhID0gewo+ICAgICAgICAgLmV4dF9sZW4gPSBBUlJBWV9TSVpFKG10ODE4M19tdGtfZGRw
X2V4dCksCj4gIH07Cj4KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2Rh
dGEgbXQ4MTg2X21tc3lzX2RyaXZlcl9kYXRhID0gewo+ICsgICAgICAgLm1haW5fcGF0aCA9IG10
ODE4Nl9tdGtfZGRwX21haW4sCj4gKyAgICAgICAubWFpbl9sZW4gPSBBUlJBWV9TSVpFKG10ODE4
Nl9tdGtfZGRwX21haW4pLAo+ICsgICAgICAgLmV4dF9wYXRoID0gbXQ4MTg2X210a19kZHBfZXh0
LAo+ICsgICAgICAgLmV4dF9sZW4gPSBBUlJBWV9TSVpFKG10ODE4Nl9tdGtfZGRwX2V4dCksCj4g
K307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDgx
OTJfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Cj4gICAgICAgICAubWFpbl9wYXRoID0gbXQ4MTkyX210
a19kZHBfbWFpbiwKPiAgICAgICAgIC5tYWluX2xlbiA9IEFSUkFZX1NJWkUobXQ4MTkyX210a19k
ZHBfbWFpbiksCj4gQEAgLTQ2Myw2ICs0ODgsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBtdGtfZGRwX2NvbXBfZHRfaWRzW10gPSB7Cj4gICAgICAgICAgIC5kYXRhID0gKHZv
aWQgKilNVEtfRElTUF9NVVRFWCB9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxODMtZGlzcC1tdXRleCIsCj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElT
UF9NVVRFWCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODYtZGlz
cC1tdXRleCIsCj4gKyAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9NVVRFWCB9LAo+
ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItZGlzcC1tdXRleCIsCj4g
ICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9NVVRFWCB9LAo+ICAgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1vZCIsCj4gQEAgLTQ3NSwxNCArNTAy
LDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kZHBfY29tcF9kdF9p
ZHNbXSA9IHsKPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX09WTCB9LAo+ICAg
ICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZGlzcC1vdmwiLAo+ICAgICAg
ICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfT1ZMIH0sCj4gKyAgICAgICB7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE4Ni1kaXNwLW92bCIsCgpBZGQgIm1lZGlhdGVrLG10ODE4Ni1k
aXNwLW92bCIgdG8gYmluZGluZyBkb2N1bWVudC4KCj4gKyAgICAgICAgIC5kYXRhID0gKHZvaWQg
KilNVEtfRElTUF9PVkwgfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTkyLWRpc3Atb3ZsIiwKPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX09WTCB9
LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZGlzcC1vdmwtMmwi
LAo+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfT1ZMXzJMIH0sCj4gKyAgICAg
ICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4Ni1kaXNwLW92bC0ybCIsCgpEaXR0by4K
Cj4gKyAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9PVkxfMkwgfSwKPiAgICAgICAg
IHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWRpc3Atb3ZsLTJsIiwKPiAgICAgICAg
ICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX09WTF8yTCB9LAo+ICAgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItZGlzcC1wb3N0bWFzayIsCj4gICAgICAgICAgIC5kYXRh
ID0gKHZvaWQgKilNVEtfRElTUF9QT1NUTUFTSyB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDgxODYtZGlzcC1wb3N0bWFzayIsCgpEaXR0by4KCj4gKyAgICAgICAgIC5k
YXRhID0gKHZvaWQgKilNVEtfRElTUF9QT1NUTUFTS30sCj4gICAgICAgICB7IC5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10MjcwMS1kaXNwLXB3bSIsCj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQg
KilNVEtfRElTUF9CTFMgfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTY3LWRpc3AtcHdtIiwKPiBAQCAtNTExLDEyICs1NDQsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgbXRrX2RkcF9jb21wX2R0X2lkc1tdID0gewo+ICAgICAgICAgICAuZGF0
YSA9ICh2b2lkICopTVRLX0RQSSB9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxODMtZHBpIiwKPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19EUEkgfSwKPiAr
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg2LWRwaSIsCgpEaXR0by4KCj4g
KyAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRFBJIH0sCj4gICAgICAgICB7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10MjcwMS1kc2kiLAo+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICop
TVRLX0RTSSB9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHNp
IiwKPiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19EU0kgfSwKPiAgICAgICAgIHsgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRzaSIsCj4gICAgICAgICAgIC5kYXRhID0gKHZv
aWQgKilNVEtfRFNJIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4
Ni1kc2kiLAoKRGl0dG8uCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArICAgICAgICAgLmRhdGEg
PSAodm9pZCAqKU1US19EU0kgfSwKPiAgICAgICAgIHsgfQo+ICB9Owo+Cj4gQEAgLTUzMyw2ICs1
NzAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHJtX29mX2lkc1td
ID0gewo+ICAgICAgICAgICAuZGF0YSA9ICZtdDgxNzNfbW1zeXNfZHJpdmVyX2RhdGF9LAo+ICAg
ICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtbW1zeXMiLAo+ICAgICAgICAg
ICAuZGF0YSA9ICZtdDgxODNfbW1zeXNfZHJpdmVyX2RhdGF9LAo+ICsgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxODYtbW1zeXMiLAo+ICsgICAgICAgICAuZGF0YSA9ICZtdDgx
ODZfbW1zeXNfZHJpdmVyX2RhdGF9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxOTItbW1zeXMiLAo+ICAgICAgICAgICAuZGF0YSA9ICZtdDgxOTJfbW1zeXNfZHJpdmVy
X2RhdGF9LAo+ICAgICAgICAgeyB9Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
