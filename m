Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3C2C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 00:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sjH8k+X0o3sPy5j9yxwP/6frpLSpRRmomFo72u6Mefw=; b=p0ZTkAW6v4Gx9JUurB95iTc8mJ
	4hmOY/sgHKzLx+fCq3eUw/qlpwNkc6dT/se+/4N5rohWuF6XrTyIT44FyIxZraKltibWUNdQ1PWYz
	rDirL1056L8pkac6Q6vZOvH0Q19Ma1l5xnyd3DJz3HQqIuDj7vcxqkNYu9NL2NU6QZ8B6sA22UhwU
	EJrTn4BfrBOFgXebqqb6hGvoKGwrGTVhHzmRKTk8x7hx4I+cEM70y5xAQlBm6YNi4Wtdfu0wvCwsx
	RGbs2M8rfm9ENejRUm4tWunOta6ZOsuagjABfrHM7Gf4GZgl+v//49zXRL+TybIj/KAgx5QPuixAN
	rwbcq/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obW7O-000fgh-2X; Fri, 23 Sep 2022 00:00:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obW73-000fRi-WE; Fri, 23 Sep 2022 00:00:15 +0000
Received: from notapiano.myfiosgateway.com (unknown [71.190.76.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E0D76602229;
	Fri, 23 Sep 2022 00:59:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663891197;
	bh=XI3oHZqDLqJjLNw81Hk83f5UFOa5J7x8UqAktxIuW38=;
	h=From:To:Cc:Subject:Date:From;
	b=knOY+Gi223BPJ4Tvih1evj2OSeaF5P6zcFgDAyjXpgbYQ4Mh0hIS2g+c00gB/eQEh
	 u7upkEyny6/K8T+scWUOQeUixpGnynKlUWfRTX0iA/KnycVTGYX6RYTK6ZuQebDC4R
	 2nk9Nm47p/OzFYhgmbTrCHzVOo9roJOrGq1djpnR0wPVHDYAto+dDXwzNn92AOOVte
	 B/mihfKE8PUCKfUbOwIuiVVyX9xwA3CK2iWxk1XeOzo4GszZBZ0ykgEt6HBjlYCAdS
	 VmuxwbXJHxF+Uq3VLy4Gc6JHCJdRmMUcMAho6zy1M5FoMttw1di1/4816b731cAZkj
	 z44E2JwJ4jzXA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Tzung-Bi Shih <tzungbi@google.com>,
	alsa-devel@alsa-project.org,
	"chunxu.li" <chunxu.li@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/6] ASoC: mediatek: Allow separate handling of headphone and headset mic jack
Date: Thu, 22 Sep 2022 19:59:45 -0400
Message-Id: <20220922235951.252532-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_170014_251753_3B90FDDA 
X-CRM114-Status: UNSURE (   7.84  )
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


This series allows the headphone and headset mic jack status to be
handled separately by userspace on MT8192, MT8195 and MT8186.

Changes based on commit d0508b4f1604 ("ASoC: rk3399_gru_sound: Add DAPM
pins, kcontrols for jack detection"). Found while searching for an
alternative for JackSwitch [1].

[1] https://lore.kernel.org/all/b98a8a77-7652-1995-27ba-eb7b6d30202a@gmail.com/


Nícolas F. R. A. Prado (6):
  ASoC: mediatek: mt8192-mt6359: Expose individual headset jack pins
  ASoC: mediatek: mt8195: Expose individual headset jack pins
  ASoC: mediatek: mt8186-da7219: Add headset widgets with switches
  ASoC: mediatek: mt8186-da7219: Expose individual headset jack pins
  ASoC: mediatek: mt8186-rt5682: Add headset widgets with switches
  ASoC: mediatek: mt8186-rt5682: Expose individual headset jack pins

 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 25 +++++++++++++++++--
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 25 +++++++++++++++++--
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 17 +++++++++++--
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 17 +++++++++++--
 4 files changed, 76 insertions(+), 8 deletions(-)

-- 
2.37.3


