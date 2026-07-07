Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B95BC43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qr1IGlrekLARy25R9WI1UDHgK1tJnna2f9/3DXKhVd8=; b=LnnuMCc52Y/XBhjwDvxaXKcjDJ
	eECqrqGf0LoebSuHUXN6te7mHf+pdBU+quoNWkYXWVmdSdFot5x1obMc9IQkm/xOeHDix2agiFMDD
	5pZa8wcec8BNXnOCyDG98HiYE8JrjU3pywwy+5rXkdrvGIyh2sMOokiASv+PjXQJBexXyG5MugIgB
	zN5TD2JqNf+/jNTH6dj15YY3h6Ay4+daf44HUvS4vBu62474gX7xPlWQm9Znl42E/+mBd7OMT0p/Z
	LY7H35kKturGRgj/aDqaQpaYod+8hndfPU+uNwXXPrnNhJkivKnOQkfKuiu3AMnfR0DgstytpE3UZ
	TfRu6Yag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0OA-0000000EKoH-20q8;
	Tue, 07 Jul 2026 07:38:42 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0O7-0000000EKnm-1DhN
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 07:38:40 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6986578d8c0so5271405a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 00:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783409916; x=1784014716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qr1IGlrekLARy25R9WI1UDHgK1tJnna2f9/3DXKhVd8=;
        b=mXqSg5T7s8aLCV/kaJCblf0ixFTzL41HR+L7opQkFtUc17W2AM/YpXObPKFGt62xPO
         AvgF9rSAOQFxhNNR7hU8tuvwwgQrBs7DV+FLZeuuICFNLLRkYcJVZ66bZa3S5oVu2Xeb
         iypKOnclsXhl45ldFdTaNPiBzFcNHPMrU07A5CzW9p2X58fN93N/mUp+73btRHkCs/6d
         7j//EwP5f/0ABXW7/3WU5keUzZYsre48Dm6XMy2LIRBoEHxviKoBX9+7qUId9yvxebQ0
         PbCXNXGNyqIOjBA1/wVOuwCLP8z/kSou9QSoluniHcDoeHsgdx6B1MjxfImn93VQJQzd
         bvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409916; x=1784014716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr1IGlrekLARy25R9WI1UDHgK1tJnna2f9/3DXKhVd8=;
        b=AOLXAktu73GB5O8MeFbCliOnQoUNpWPl9IJyN+E4BC6y7/fUu6vF24T9Dlihj4zenY
         e17VFWBfhDZBmnCX8qT5Zs8la6PPQS0898ntOzVMYXOyLRn+Jb2/qkRCg3ZgerRMDzmW
         etADwEOwEZxRMgADvsPIT00p9sOAVs/B1DPHXESsc2tZdg+HS28/ZJZtWYrMCOGDVRZn
         JH45pfYcRFQdJhKBuZKTLh8S56gQTCOGDv5zrXiBsyYniFtNVfPb72fHoOZrGk12vuwS
         fKfi3O1uU6QsK4NGpGgCerwPW9269qsak4Ilbssw//bb3WAiXhyVGW4/pWZa/Ur9iYxc
         Dy4g==
X-Forwarded-Encrypted: i=1; AHgh+RrHHFekyujA7TACx4ODBH72FsxLdlNWqCJZKAmd9zwGG5Zd/rODAL7dLYy2J079MPVIdioJgvFQguKL74R8Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUcQI+akSB7Ok0/qlUKGzLarKnziT/BjuRWI+jTL63aJyyGwZO
	OWSADAFinotac1w6eB/embDYa2t1OONSAynYqwW60fvud/bvHdjGuDfk
X-Gm-Gg: AfdE7cluIqwkWMu3K6H8Ani8EJAlDhgyed0UniK8Kprmb2JMIRWOnqBAXugMUEXYlOW
	/ZNIhK3xwptU4xOfs6S5WE3kCdUw8gxDoYST/VeEj3ImwdfhBkJt8NjgsWtW2FTycmE8IgG1ns2
	8maVxRaw5RC83m+5HOPV9K3r/+Rv5tabgL3Ul3pILG1zVxrkq4Yg18CzdiJhKLV0/GORi49MDIw
	gwq0EeIjlZsjMkS4YVqOZivs8hLswdrJpyXBSPj4d7jvqWJn4K7l0y/GxDKW/eylW2wTQCC60jW
	dCnEDA/DnDg4lRUzKMzI8vThicIgYUvzNzy9ODFtiSZfoRvGQST5nacFaR47XEgHihPFoXI06dN
	s0eJYEObkwuCbmDk8Z3Jixqb95nSze0w/9ZmMD/LCBm4TVNPCP35DEdEVbZYT1E1ijd3aJUN0x9
	i3DipWUDB+m6GuguYydgnS0eEzameWAaL9YZAr/AaHzBLIGfzfKgKBChAptMILixVUfTajBzRMb
	pDS63c+Za86XHXJ70YQqNa2lwBWzJJ0JfNgHM07whjp
X-Received: by 2002:a05:6402:120b:b0:699:f995:13a with SMTP id 4fb4d7f45d1cf-69a85c32c1dmr1602091a12.32.1783409916010;
        Tue, 07 Jul 2026 00:38:36 -0700 (PDT)
Received: from eric (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d7a375sm5123969a12.15.2026.07.07.00.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:38:35 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Edward Parker <edward@topnotchit.com>
Cc: netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	coreteam@netfilter.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [RFC PATCH net v1] Revert "net: dsa: mt7530: untag VLAN-aware bridge PVID"
Date: Tue,  7 Jul 2026 09:38:26 +0200
Message-ID: <20260707073826.919541-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_003839_403102_637766B4 
X-CRM114-Status: GOOD (  11.55  )
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

This reverts commit 4cb3cd670b2a29e52dd3cfd6463e44121674c9b8.

In the case of a userport of a switchdev attached to a vlan-aware bridge,
with untagged packets incoming, tagged at ingress of the bridge:

For all switchdev userports that support SWITCHDEV_OBJ_ID_PORT_VLAN,
which includes dsa-userports, the behaviour is that the tag is visible
in the ingress-hook. The commit mentioned above changes that, making
mt7530 deviate from this. Only on mt7530 the tag is not present in the
ingress-hook.

This, for one, is a problem for the software (forwarding) fastpath.
The flowtuple for this flow is created, with the tag included and marked
with the corresponding in_vlan_ingress bit.

Inside the ingress hook of the fastpath the incoming packet is tried to
match with the hash of this tuple, but is does not match any more.
The tag is missing. The packet does not follow the software-fastpath
in this direction.

Fixes: 4cb3cd670b2a ("net: dsa: mt7530: untag VLAN-aware bridge PVID")
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 drivers/net/dsa/mt7530.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3c2a3029b10cf..752ba92b08517 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2447,7 +2447,6 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 
 	ds->assisted_learning_on_cpu_port = true;
-	ds->untag_vlan_aware_bridge_pvid = true;
 	ds->mtu_enforcement_ingress = true;
 	ds->ageing_time_min = 2 * 1000;
 	ds->ageing_time_max = (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1) * 1000;
@@ -2639,7 +2638,6 @@ mt7531_setup_common(struct dsa_switch *ds)
 	int ret, i;
 
 	ds->assisted_learning_on_cpu_port = true;
-	ds->untag_vlan_aware_bridge_pvid = true;
 	ds->mtu_enforcement_ingress = true;
 	ds->ageing_time_min = 2 * 1000;
 	ds->ageing_time_max = (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1) * 1000;
-- 
2.53.0


