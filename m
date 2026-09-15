Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CD1C88E53
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=05imLuzHyVIQMHKM04PeIvS2aG4jIS7ddgxD+8+o9YQ=; b=XnWk11k8M3SU0ql5y+SKBMJugm
	HA58ZknVBvpyojP3XCW7uE7VAJ89UDxOMSu4TysAA+Nf7nh1ZLr5vfFDir6LNLae7p8MQ/ydJRCN5
	HXUQw1JTQ2maXdgOCxuR3Y6yFDCmejI9MOZ3TacZ75bk13X8a9C7ke4w5GhX8RpJbn8Lf+T/f1v0g
	l7u0YB5M808KTfOcMkOjd4YnKFdFCyi1AL68LqdyMsxzHsMJ0dzv9flcCN+k8DX502iGCWb4Ztavl
	wVo2xS4BFuufmHZhhMKSajj/DD2pjySZGd6werGT2WxzXluXewLYJaCuu4DUkfQ54Ymqg9tS4XrkY
	PtYty0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P47-00000005iiS-0GWy;
	Tue, 15 Sep 2026 09:02:59 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P44-00000005igy-1pGi
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 09:02:57 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c293c683202so426274666b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462974; x=1790067774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=05imLuzHyVIQMHKM04PeIvS2aG4jIS7ddgxD+8+o9YQ=;
        b=Gk62puWvc/HqiZ2+xEaK1d4A/nBaGc1lq0K15MUr0+DvafSMRC5GSbvVnrJIwZyDNc
         rY9GmRDLAWQwPk5q7qGwTr1uyDYJbGU4O0QeeYOivssTF0qS8B5qjWyPV//tMfmef8dg
         26A255aMA8eHSREe9YotV2EJlsa6Zk9k+89ldBNCZvq/PBpers1zszs9XV0pX0Km2D9D
         IjYgZ8hYsmQrTGlVsDCUH1eo4DX+tYSkCI6QfS+QC070oQgZoRe6gVqN+tOjS2lObl+q
         ldjb+eDGapE8cPA51N8T8VEnuL16S9qBt3GU97u0mJLbkurBMqDZ6YGmLGghyPPizNyI
         MYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462974; x=1790067774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05imLuzHyVIQMHKM04PeIvS2aG4jIS7ddgxD+8+o9YQ=;
        b=AXLzDWnU9dNGhoijeMhud9OixjdEbYx4xUO9iFvz24eMMRstsqHf+8OhDOTdaaHVO+
         RMgI5hoKcdBZghle0Extsgia+2oXyLLUpdqhn0bWsQHzFr2cdkq8uMSoGQE6gR9CHzme
         zO0ue40z/2nA0o3XMvOdTr5sJ5dmCDiDxWgh398gF2m6pSs2k59oghgd2THqRka41E9h
         X3EW9NPeTWMbZoUQvi5lDwKefMsTxbyQ+Ud6TKLxacMVAOgLYDg3sJEuXQjN/1+oIvuc
         0j87aW4Kw+ZrrDd8jqwW7Tp4mM7qd/qIEgGBrKaZ/0QO8E7QVrh4gf3EtgTCoP2Me6GS
         aGIg==
X-Forwarded-Encrypted: i=1; AKwUvBxOlsCZ+jXkNW0ajbCVLwF5C9AiQBUI5mmTEM+HDEpnGxExMHKPsC/+OZu8QpxhGVjEACe4MeHTQcr3pRgw4g==@lists.infradead.org
X-Gm-Message-State: AFuF++koYS19SMK0HGfhXo3oZczwSwVA4gtgD/jEG617jTUSlVcZJQA8
	IRLi8pKvZ5elfvUCHGe2GSmO//QCd6L6Rv8tcL1Vx1KGfGbMEDf3olod
X-Gm-Gg: AYBFou0HzXnjx1dNyqiYf3Zfm/OlpbuiqcN24mrCE+MsUXVYqMFe63yJlEZ8YxBRnq4
	DJylVmeKmgEZVxMkEipYNLOEr2GWUr4kiuMnywvFdIpI3WLCZJWPF/57St3nJML2lEiwiOTSJ6z
	LqaAh5jQV8j+yZLwTEzakdSMhx4SN5dOAIptp0sUdbYM6V6rvkHMENx0bPVBavhWCHQWc6qq2Lr
	jsAX8PFMFSN85CBiJcWIezarFOLL70RVDjZWcQb6AZPxcIRFuTPf3Bz0M/VO5eMxk9c+3bheCVY
	YTiJvrHeO/UfObaU+qZetbUBr3VKsTagiqLS1wFdX57y/qoC1l+0LvXx9tg5/s8GdYF0fiovUSK
	kcdtaF8ISNw/c0c+aen+hRvnGRtLktx+neMEvuwP3ppsSUO4he/aVOXgzWRbt90mIMeLR1mX2Uk
	LPe9d0K/P80X3YBO/BH9f4NuANSD/jwvGx2YRpF1tZ4x1cR/2F5UXhAwt/N3wo5W5NwWMxu94oc
	irMcdy0q6Y0BkuxAnfiLIC9oDwfkQrNkioNJ9onHWVHccjRKSphqKaTgmCi0p1rwUprON8v8i4u
	I4rnKylS2J3LWK+x7Uo5eN6bztm9g4lG4jm7j0lMwAn0jpJY+MziSOGy1O+mass+9yjDEemZdp0
	o1HKImFKgxuDI+niLBDWhAMZuSyYsQiyH1ax6U4xB1l4bktAR6ty0mJ/bFDWmLqzCqTd55aX5iT
	Vrjuo1crpqzuPwUjAB+h6YDl/ybNo8ObD3+W0rneuUTEPlB1GTAMK3SFrrViabO8Qr1ATzamBS4
	7/O4tkeqts=
X-Received: by 2002:a05:6938:a084:20b0:c29:d525:72a9 with SMTP id a640c23a62f3a-c29d5259cf5mr42196166b.49.1789462973844;
        Tue, 15 Sep 2026 02:02:53 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:53 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/6] usb: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:17 +0000
Message-ID: <20260915090223.1346-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_020256_489259_BAE4215D 
X-CRM114-Status: UNSURE (   9.41  )
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

Several drivers in the USB subsystem forget to call dont_use_autosuspend()
on teardown or error, causing potential resource leaks. This series adds
the missing calls.

The offending drivers were found using a semantic patch for Coccinelle
I'm working on [1].

[1] https://lore.kernel.org/all/20260915064327.1377-1-joshua.crofts1@gmail.com/

Joshua Crofts (6):
  usb: core: add missing pm_runtime_dont_use_autosuspend() call
  usb: xhci-mtk: add missing pm_runtime_dont_use_autosuspend() call
  usb: xhci: add missing pm_runtime_dont_use_autosuspend() calls
  usb: typec: ucsi: ccg: add missing pm_runtime_dont_use_autosuspend()
    call
  usb: mtu3: add missing pm_runtime_dont_use_autosuspend() calls
  usb: cdns3: add missing pm_runtime_dont_use_autosuspend() call

 drivers/usb/cdns3/cdns3-plat.c    | 1 +
 drivers/usb/core/hub.c            | 1 +
 drivers/usb/host/xhci-mtk.c       | 2 ++
 drivers/usb/host/xhci-plat.c      | 2 ++
 drivers/usb/mtu3/mtu3_plat.c      | 2 ++
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 6 files changed, 9 insertions(+)

-- 
2.47.3


