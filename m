Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B00C19F2D
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Aug 2022 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tC2GhhC8WwZTml4OrKQ+dOaX+Zfkd8eMJ9gy4ApGFtQ=; b=sCNlMvF7mFmCIR9pJZCfH9xJcT
	qOe1bPtTLbidpJLjTvt686WXgtgebr2BcD0BEbkaqMAmOyat59akHYwmuI3ystYN1Go3Mh4S8QTHA
	v4QpqR+AGunBo9V5I/pRQA/Q/N0lEzuJuqi4HNneP7niKZIshvHxAVXuMaNcvqjoM+FnkHJWeM8yL
	1De5HXldNWIHfLzdgMNbnoC1zuYRgb9YeGQOAmpHhe522VJQZifhmaKZDVJhAYABafXrpmic7j5Zb
	lT9/Oh7NBpZjHoN+5Sin5LTvHuo1iI4agxzowicuJOMR5zvHzkR7APxymwTVo0eqa21FH2YNM4NLh
	9ZsQQbQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtKK-00FYBW-PO; Sat, 13 Aug 2022 15:45:28 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtJv-00FY0I-8A; Sat, 13 Aug 2022 15:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660405475; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UoDUPawCJzPV93BFqlANuNJ48wXWXD/wKvh87Ls7sTkHI1HwkLILCvYqzdUyYIEthHXwKH62yV5XeGhVVaAVt+E8mf9huUbnVwhff0dAG9Gv1kx85c4fzN2ROLLvAGCtvYSsMjobgJ8SNOfVjl5QjLEf6Fjm5J4zo7Bj+FksVVc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660405475; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=tC2GhhC8WwZTml4OrKQ+dOaX+Zfkd8eMJ9gy4ApGFtQ=; 
	b=S+KKdqFVMAjdaEKEOKmdH1gjgCm9fZyXSAI2BKhMw6kt6p80tuUNlx1+3Wvzs9E+mrYXSjYfqsE/1YYfShdnNgO+L9s8ASCDfxVyaQFhyUx/38FLNWv16fT98/sxaSQemsQ8NSpmYxd4XsSI3/pKtglblNAC6+qaY3dNEeSp3Qc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660405475;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=tC2GhhC8WwZTml4OrKQ+dOaX+Zfkd8eMJ9gy4ApGFtQ=;
	b=XJ1HybxkpDbmxmmlzZ9MFghlUwXGAEiqakT8JApuVST6U4fB+BTT1mfZSnxl9TsD
	6hQXRBtYrPnhUYDx8gDuQHfwtQ5S/umbXeTrKBcheGGIg8BHG/HuY0/aOT7ZZMnMFIm
	rd7arNgssq0ODltiiyZCkaCXxUbh6r9DO3x18bzk=
Received: from arinc9-PC.lan (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1660405472608660.8592124322715; Sat, 13 Aug 2022 08:44:32 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Sander Vanheule <sander@svanheule.net>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v2 0/7] completely rework mediatek,mt7530 binding
Date: Sat, 13 Aug 2022 18:44:08 +0300
Message-Id: <20220813154415.349091-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_084503_391881_AE0F9B52 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello.

This patch series brings complete rework of the mediatek,mt7530 binding.

The binding is checked with "make dt_binding_check
DT_SCHEMA_FILES=mediatek,mt7530.yaml".

If anyone knows the GIC bit for interrupt for multi-chip module MT7530 in
MT7623AI SoC, let me know. I'll add it to the examples.

If anyone got a Unielec U7623 or another MT7623AI board, please reach out.

v2:
- Change the way of adding descriptions for each compatible string.
- Split the patch for updating the json-schema.
- Make slight changes on the patch for the binding description.

Arınç ÜNAL (7):
  dt-bindings: net: dsa: mediatek,mt7530: make trivial changes
  dt-bindings: net: dsa: mediatek,mt7530: fix reset lines
  dt-bindings: net: dsa: mediatek,mt7530: update examples
  dt-bindings: net: dsa: mediatek,mt7530: define port binding per compatible
  dt-bindings: net: dsa: mediatek,mt7530: remove unnecesary lines
  dt-bindings: net: dsa: mediatek,mt7530: define phy-mode for each compatible
  dt-bindings: net: dsa: mediatek,mt7530: update binding description

 .../bindings/net/dsa/mediatek,mt7530.yaml       | 1017 +++++++++++++-----
 1 file changed, 767 insertions(+), 250 deletions(-)



