Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F323FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 09:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QJkEFlzUkwczkDE8vwPAnuQI3vqs1fhZ6UZjmUzZWnc=; b=ooCLUw/wAEtsLu
	1TQqKlgrgKN+dToeRryCE9I3Hx3uJ9+WwIjYlHNEkT5xM0m8v/ws/1Xe0Dfnoq7BOloyqUjebaw0s
	z4pm/vhBdRzo402yxQXKxzU8kGrWVerKLATz/l1Gl0+EtnEXRFbHoRAhLTcjobpnw/NtjRo4wJ9wV
	HjYIkaBG95jxuCQIY8DjgmvG0suHI4PDnu6+eheebrr2QBKomwdRALlgCM5J+35Eo6ShTYtHcjNyG
	5U/0Dq+ShJ7PmLSFmsVKEpMIiSa0oWMx/IDixOL4qOh/kZPHfNlD2X+mP3I966JwK/89vnXRrSWKc
	Bg3OOsuwvCSogWG8JmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4g4-009Qbv-4s; Fri, 04 Mar 2022 09:56:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4eR-009Q2s-7p; Fri, 04 Mar 2022 09:55:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B18E11F46483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646387703;
 bh=EfrLQeiJMUy4oMQI58UrAdjbGw+ADzKMI7I2grHoz4M=;
 h=From:To:Cc:Subject:Date:From;
 b=LJuRzerx/ge7QtwE1iuUcucq6QplNy5celhG3oIai0DzzGpXlLqI/R0DQlelkg3nz
 BnbC5PXT2XvUCdjrgyhE3M60uVU85X5rg6GSOLu7MXsCeqFs/QCY7rVhv7geTHc+GF
 c/+2NUH4XSyIeK+TwD8p9u/RWCYMN9246caOp5e1uyU0Oyisba04A5lm/ZFJbTpvXQ
 uWOF09ZcwSVxxoSSkMxgKq9q2oOocWInIhklbyR+S1KvHGntFoiYcEU2hd4kp8AxV/
 y+671YfAqPE5EnJlthsSaUSMnYcgcPZSQX/tw99UorcH1mcAEVOy8Crq9aneJjKxt0
 dj9rPtk84IMiQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jason-jh.lin@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/3] Fix MediaTek display dt-bindings issues
Date: Fri,  4 Mar 2022 10:54:55 +0100
Message-Id: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_015507_476357_DC998AAE 
X-CRM114-Status: UNSURE (   7.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The vdosys0 series carried a nice dt-bindings conversion of the old
txt documentation for the entire mediatek-drm driver, but some of
the issues in there weren't seen.

This series is fixing all of the issues pointed out by a
`dt_binding_check` run, followed by `dtbs_check`.

AngeloGioacchino Del Regno (3):
  dt-bindings: display: mediatek,mutex: Fix mediatek,gce-events type
  dt-bindings: display: mediatek,ovl: Fix 'iommu' required property typo
  dt-bindings: display: mediatek: Fix examples on new bindings

 .../display/mediatek/mediatek,aal.yaml        | 24 +++--
 .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
 .../display/mediatek/mediatek,color.yaml      | 23 +++--
 .../display/mediatek/mediatek,dither.yaml     | 23 +++--
 .../display/mediatek/mediatek,dpi.yaml        |  3 +-
 .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
 .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++---------
 .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
 .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
 .../display/mediatek/mediatek,mutex.yaml      | 27 +++--
 .../display/mediatek/mediatek,od.yaml         | 14 ++-
 .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
 .../display/mediatek/mediatek,ovl.yaml        | 28 ++++--
 .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
 .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
 .../display/mediatek/mediatek,split.yaml      | 17 +++-
 .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
 .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
 18 files changed, 318 insertions(+), 180 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
