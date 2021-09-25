Return-Path: <SRS0=T8Q+=OP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE54C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Sep 2021 02:17:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4E3661029
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Sep 2021 02:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4E3661029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/l2Bse52NbIQuwr2+0d4fl/ltnXzo9hzCOCFDjhrHg=; b=Tvtn9l8ABuI5nu
	mLrOPIJcX6pvYK5uw4n4igc+X5v2+FnqCbbR1QrlBB8GSifYkk/A6kWLm6fPBduQBz5YkLf+Ei3wY
	BOQCEywpS9le0zQwwHmlem5qxbxKsVQzLNLXad+XrdygyU3lF7yi2tshRLj36cyUNMgjC4dcwcTIR
	54AgERCBgF4jBtk+UGpH+DAea9pmPk9wZKrvm1/wv3/IJw3rl0VsFnOveOs0R8Tx1b9vdb+j9yqoq
	R2cc5IMUZ9rDxtlIhyblCKrXvLgykEFJ0dSflds4EyeZNQqgKMYYK6CW12nXoMmMeYe0DJFHGlFZ9
	FesqAAIoaXMf89HDhZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTxG8-00FyvN-0I; Sat, 25 Sep 2021 02:17:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTxFt-00FytG-KC; Sat, 25 Sep 2021 02:17:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1787261265;
 Sat, 25 Sep 2021 02:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632536253;
 bh=D6mVq6Ws5LARrt0i89PJK+aDRPrFBg+LXJD8hpN1g/g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CViJisyPwkv5aUHbjwT60mL3x9qr1cZjSx1lpiNW8fc46hl26wDvn3hwTH0s+KQ9c
 txfOWQkvAjBtURVkGR4ZjryyWIceDcWsucyiUlxMDvl508YHexoHy90OLwRVl8gM8l
 9GPIChPhvYNDHP00usmTuRefu1vYliyayBzpFmFDhEy6ttTGLo8uUd97PheGMy0Vvt
 HGIFndGKjusR3hsiAtKoYJQroKz9GiNUEmbYqynCOb77nOjxEEqsmMJh8avv/DRhaU
 Ja/TMzNE48rwBRoV+oI0+aJdhkQNQlTGgHazEuGxmbUzmgd8kUMzbKCiQmwq0r202s
 FjTkTPIJLKJSA==
Received: by mail-ed1-f43.google.com with SMTP id y89so32418642ede.2;
 Fri, 24 Sep 2021 19:17:32 -0700 (PDT)
X-Gm-Message-State: AOAM531JhEA5iIGMxjESHfnE0fXLVFS5wOrUwCJ1ELgHU2z15KlQOr0f
 2SwfU7E345n1ZpjlrHhDMse0Si7B8lUogh7fyw==
X-Google-Smtp-Source: ABdhPJy43x5ohkW8Db2PjWu46qMaTH2NqNO+cakkPZW/c2xsys2gf6YB/Ly9CvD7M2qmWakZbvEMWap8f0ltaHgNkUA=
X-Received: by 2002:aa7:c617:: with SMTP id h23mr8737188edq.357.1632536251531; 
 Fri, 24 Sep 2021 19:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Sep 2021 10:17:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY__VZ4Q5RsA4eiSfgLdwxg3HGV1-YEMa0L2LHHRdE73koQ@mail.gmail.com>
Message-ID: <CAAOTY__VZ4Q5RsA4eiSfgLdwxg3HGV1-YEMa0L2LHHRdE73koQ@mail.gmail.com>
Subject: Re: [PATCH v11 05/16] dt-bindings: display: mediatek: merge: add
 additional prop for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, fshao@chromium.org, 
 Moudy Ho <moudy.ho@mediatek.com>, roy-cw.yeh@mediatek.com, 
 Fabien Parent <fparent@baylibre.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_191735_316705_8A354FF5 
X-CRM114-Status: GOOD (  16.97  )
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
MjAyMeW5tDnmnIgyMeaXpSDpgLHkuowg5LiL5Y2IMTE6NTLlr6vpgZPvvJoKPgo+IGFkZCBNRVJH
RSBhZGRpdGlvbmFsIHByb3BlcnRpZXMgZGVzY3JpcHRpb24gZm9yIG10ODE5NToKPiAxLiBhc3lu
YyBjbG9jawo+IDIuIGZpZm8gc2V0dGluZyBlbmFibGUKPiAzLiByZXNldCBjb250cm9sbGVyCj4K
PiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+
Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwgICAgICB8
IDMxICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbAo+IGluZGV4
IDc1YmVlYjIwN2NlYi4uNTQyZGQ3MTM3ZDNiIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxtZXJnZS55YW1sCj4gQEAgLTM4LDYgKzM4LDE5IEBAIHByb3BlcnRpZXM6Cj4g
ICAgY2xvY2tzOgo+ICAgICAgaXRlbXM6Cj4gICAgICAgIC0gZGVzY3JpcHRpb246IE1FUkdFIENs
b2NrCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IE1FUkdFIEFzeW5jIENsb2NrCj4gKyAgICAgICAg
ICBDb250cm9sbGluZyB0aGUgc3luY2hyb25vdXMgcHJvY2VzcyBiZXR3ZWVuIE1FUkdFIGFuZCBv
dGhlciBkaXNwbGF5Cj4gKyAgICAgICAgICBmdW5jdGlvbiBibG9ja3MgY3Jvc3MgY2xvY2sgZG9t
YWluLgo+ICsKPiArICBtZWRpYXRlayxtZXJnZS1maWZvLWVuOgo+ICsgICAgZGVzY3JpcHRpb246
Cj4gKyAgICAgIFRoZSBzZXR0aW5nIG9mIG1lcmdlIGZpZm8gaXMgbWFpbmx5IHByb3ZpZGVkIGZv
ciB0aGUgZGlzcGxheSBsYXRlbmN5Cj4gKyAgICAgIGJ1ZmZlciB0byBlbnN1cmUgdGhhdCB0aGUg
YmFjay1lbmQgcGFuZWwgZGlzcGxheSBkYXRhIHdpbGwgbm90IGJlCj4gKyAgICAgIHVuZGVycnVu
LCBhIGxpdHRsZSBtb3JlIGRhdGEgaXMgbmVlZGVkIGluIHRoZSBmaWZvLgo+ICsgICAgICBBY2Nv
cmRpbmcgdG8gdGhlIG1lcmdlIGZpZm8gc2V0dGluZ3MsIHdoZW4gdGhlIHdhdGVyIGxldmVsIGlz
IGRldGVjdGVkCj4gKyAgICAgIHRvIGJlIGluc3VmZmljaWVudCwgaXQgd2lsbCB0cmlnZ2VyIFJE
TUEgc2VuZGluZyB1bHRyYSBhbmQgcHJldWxyYQo+ICsgICAgICBjb21tYW5kIHRvIFNNSSB0byBz
cGVlZCB1cCB0aGUgZGF0YSByYXRlLgo+ICsgICAgdHlwZTogYm9vbGVhbgo+Cj4gICAgbWVkaWF0
ZWssZ2NlLWNsaWVudC1yZWc6Cj4gICAgICBkZXNjcmlwdGlvbjoKPiBAQCAtNTAsNiArNjMsMTEg
QEAgcHJvcGVydGllczoKPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3BoYW5kbGUtYXJyYXkKPiAgICAgIG1heEl0ZW1zOiAxCj4KPiArICByZXNldHM6Cj4gKyAg
ICBkZXNjcmlwdGlvbjogcmVzZXQgY29udHJvbGxlcgo+ICsgICAgICBTZWUgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L3Jlc2V0LnR4dCBmb3IgZGV0YWlscy4KPiArICAg
IG1heEl0ZW1zOiAxCj4gKwo+ICByZXF1aXJlZDoKPiAgICAtIGNvbXBhdGlibGUKPiAgICAtIHJl
Zwo+IEBAIC02NywzICs4NSwxNiBAQCBleGFtcGxlczoKPiAgICAgICAgICBwb3dlci1kb21haW5z
ID0gPCZzcG0gTVQ4MTczX1BPV0VSX0RPTUFJTl9NTT47Cj4gICAgICAgICAgY2xvY2tzID0gPCZt
bXN5cyBDTEtfTU1fRElTUF9NRVJHRT47Cj4gICAgICB9Owo+ICsKPiArICAgIG1lcmdlNTogZGlz
cF92cHBfbWVyZ2U1QDFjMTEwMDAwIHsKPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10ODE5NS1kaXNwLW1lcmdlIjsKPiArICAgICAgICByZWcgPSA8MCAweDFjMTEwMDAwIDAgMHgx
MDAwPjsKPiArICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNTA3IElSUV9UWVBFX0xFVkVM
X0hJR0ggMD47Cj4gKyAgICAgICAgY2xvY2tzID0gPCZ2ZG9zeXMxIENMS19WRE8xX1ZQUF9NRVJH
RTQ+LAo+ICsgICAgICAgICAgICAgICAgIDwmdmRvc3lzMSBDTEtfVkRPMV9NRVJHRTRfRExfQVNZ
TkM+Owo+ICsgICAgICAgIGNsb2NrLW5hbWVzID0gIm1lcmdlIiwibWVyZ2VfYXN5bmMiOwoKRGVm
aW5lIGNsb2NrLW5hbWVzIGZpcnN0LgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICAg
cG93ZXItZG9tYWlucyA9IDwmc3BtIE1UODE5NV9QT1dFUl9ET01BSU5fVkRPU1lTMT47Cj4gKyAg
ICAgICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZTEgU1VCU1lTXzFjMTFYWFhYIDB4
MDAwMCAweDEwMDA+Owo+ICsgICAgICAgIG1lZGlhdGVrLG1lcmdlLWZpZm8tZW4gPSA8MT47Cj4g
KyAgICAgICAgcmVzZXRzID0gPCZ2ZG9zeXMxIE1UODE5NV9WRE9TWVMxX1NXMF9SU1RfQl9NRVJH
RTRfRExfQVNZTkM+Owo+ICsgICAgfTsKPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
