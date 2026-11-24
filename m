Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE19606A326
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ff4jZh2t;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=MrPP42qm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SHQD7/yk1kc5LIzMqPgYiZblY3LzJCrNlaOhDTO3yRk=; b=ff4jZh2t26xoas
	Jc4+vEF4DwBMBoh2XObXABRDPHEhxk7t2s29aRLP8FvKnE3A0I/4ZnqPGmdX6uk34EzHzPxk3u+YN
	3yDDEcNYhSSMb9DwyjK0PpkNJzRUgZrcEPcJogaLsYI7lyxJ0akKQ4iYHLnrTwdy3v9R8N6JvRrj2
	pXSGbUXzzqIGrr33uJAEnEIKKpVWHf8nOnSGJvLX73p4ds7MNpPa+ytrY/3aWRQ+yLl1ejGnM9r7g
	WSRQ08DbM79R+M/ldqZ+0tGk//3Wl4kKxn5dmjBl2Bk5CHONYm8cBM9l3WBuvyyJr1P9twJznKaoe
	vLU034eiik4LXqgiQ65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlsN-00000005tNl-1n3L;
	Tue, 24 Nov 2026 08:27:43 +0000
Received: from fraori-sdnproxy-3.icoremail.net ([132.226.202.154])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlsC-00000005tBS-3Uwy;
	Tue, 24 Nov 2026 08:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=SHQD7/yk1kc5LIzMqPgYiZblY3LzJCrNla
	OhDTO3yRk=; b=MrPP42qmI+mfYCKON9L0qHcSluwY1bsa5f3uZIHqAE/fZ1Mcq4
	0BHJEjGbtqN9rKdmGVjn4nFOd5IXFuPKbz0O/EmwkTj1pA/POSDC+a4enDoWBG8w
	a/JYD7GSm3Xhl1EjfhIZQOsnuxwtUDb26Hp2SoD31C9CD2N8RnTjFhHgE=
Received: from mt7530_series_05.eml (unknown [58.206.202.11])
	by web4 (Coremail) with SMTP id ywQGZQD3sgBkSgVrlGxJAg--.14120S2;
	Tue, 24 Nov 2026 16:27:16 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 5/5] net: dsa: mt7530: disable regulators on mt753x_setup() failure
Date: Tue, 24 Nov 2026 16:25:57 +0800
Message-ID: <179550875790.4156.14185923394520188230@mail.zgclab.edu.cn>
In-Reply-To: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: ywQGZQD3sgBkSgVrlGxJAg--.14120S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1furW8ur1DAw48WFyrtFb_yoW8AFykp3
	yUZa40krWvgF1UWa97Cw4UZas8ArZ3Ga4UGFZ7KwsIkw4ayrn09F18ta4q9rnxtr4rtw4S
	y395AFWruFsrZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBCb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE
	52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAV
	WUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8Zw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcR6wDUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgQBD2sFSC8E2AAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_002733_205812_906FDC8E 
X-CRM114-Status: GOOD (  11.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt753x_setup() calls the per-variant sw_setup() (mt7530_setup() for the
MT7530), which enables the regulators, but the steps that follow returned
on error without disabling them. The common case is mt7530_setup_irq()
returning -EPROBE_DEFER, which leaves the rails on and re-enables them on
every re-probe.

Route all failure paths after sw_setup() to a shared error label that
disables the regulators, and move the mdio irq teardown there instead of
handling it inline.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/net/dsa/mt7530.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 1ac4ac1a0566..963d14534175 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3223,11 +3223,11 @@ mt753x_setup(struct dsa_switch *ds)
 
 	ret = mt7530_setup_irq(priv);
 	if (ret)
-		return ret;
+		goto err_disable_pwrs;
 
 	ret = mt7530_setup_mdio(priv);
 	if (ret)
-		return ret;
+		goto err_disable_pwrs;
 
 	/* Initialise the PCS devices */
 	for (i = 0; i < priv->ds->num_ports; i++) {
@@ -3239,15 +3239,23 @@ mt753x_setup(struct dsa_switch *ds)
 	if (priv->create_sgmii)
 		ret = priv->create_sgmii(priv);
 
-	if (ret && priv->irq_domain)
-		mt7530_free_mdio_irq(priv);
+	if (ret)
+		goto err_free_irq;
 
-	if (!ret && priv->bus) {
+	if (priv->bus) {
 		mt7530_stats_refresh(priv);
 		schedule_delayed_work(&priv->stats_work,
 				      MT7530_STATS_POLL_INTERVAL);
 	}
 
+	return 0;
+
+err_free_irq:
+	if (priv->irq_domain)
+		mt7530_free_mdio_irq(priv);
+err_disable_pwrs:
+	mt7530_disable_pwrs(priv);
+
 	return ret;
 }
 


