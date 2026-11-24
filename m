Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAFC60A2602
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aeVHfHIW;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=agx1LFbq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JTT3r5Nnkiq1Jzp6/EZE8sHsQcNwVpQs4cOU6x16a4A=; b=aeVHfHIW8SI7uD
	WhY337tYpa/wESA5gvu+t6RzPWvrZRvR6DfjO3C3Revcf7fkRoQ0cUcxMoMUec+l347ooSoszOxdV
	lxdMaObUKKGeDsq6Ailfw4hrjaxRpV+TjlmYjx23kWmr+uK64NpLdqqHZ8SAhloP/mnXZvwWUJETi
	tuUzYwtsX/ug6V0pJPqDwxVCQxQPbZpvZNF//20okvyFEkKD90PzfEGgQWWJzUhfagpTg1Z6MPc9G
	XmuQrEba2BSmg/Zxppu0cjbhgACQxEL4mNjvm7ZUcjXbwGq/N3A992PfYIjPFa27nzzrjRCdvudWL
	kwEBW4y54ZL89nH+980w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlsE-00000005tDU-05Us;
	Tue, 24 Nov 2026 08:27:34 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlrx-00000005t53-41ET;
	Tue, 24 Nov 2026 08:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=JTT3r5Nnkiq1Jzp6/EZE8sHsQcNwVpQs4c
	OU6x16a4A=; b=agx1LFbqwr5UXbFZNOwdR83BbT4yFqhD9Tqh4ghM6rt0mmFY4/
	09KB6Z8MRTQGED2GH2c+33unBi666/f5KGvGjYchYu0v5ri4D9Qtkura9IdcSuY+
	j7d0woEERwFPLwCP+EL5HyH93dMP9TDpsG/9uqM3x4cTJQmrk6cv8cNpU=
Received: from mt7530_series_03.eml (unknown [58.206.202.11])
	by web1 (Coremail) with SMTP id yAQGZQDXSTpaSgVrnee8Ag--.35646S2;
	Tue, 24 Nov 2026 16:27:07 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 3/5] net: dsa: mt7530: register the GPIO controller last in setup
Date: Tue, 24 Nov 2026 16:25:57 +0800
Message-ID: <179550875790.4156.7464757884919680732@mail.zgclab.edu.cn>
In-Reply-To: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: yAQGZQDXSTpaSgVrnee8Ag--.35646S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4rtr1xJr47KFy8Aw15XFb_yoW8GFW7pF
	WUZa42g34DtF45G3WkAw48Zas8tFyxGFy7A397Z390yw1avrWUKrW5KFyF9F1UGFWfGa1S
	yF4fAFW3ZFsrXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE
	52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXV
	WUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8Zw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgXo2DUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgQBD2sFSC8EngAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_002718_383276_C6D12F3B 
X-CRM114-Status: GOOD (  14.03  )
X-Spam-Score: -2.8 (--)
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

mt7530_setup_gpio() publishes a GPIO controller that userspace and other
drivers can use immediately, but it currently runs before the FDB flush,
which is the last step of setup that can fail.

Move the GPIO controller registration after the FDB flush so that the
controller is only made visible once every fallible step, including the
FDB flush, has succeeded. This becomes important in the next patch, where
the failure paths disable the regulators and return an error, so the
controller must not be registered across a failed setup.

Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/net/dsa/mt7530.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index eb55cc969f43..e208d942b577 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2585,6 +2585,11 @@ mt7530_setup(struct dsa_switch *ds)
 		}
 	}
 
+	/* Flush the FDB table */
+	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
+	if (ret < 0)
+		return ret;
+
 #ifdef CONFIG_GPIOLIB
 	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
 		ret = mt7530_setup_gpio(priv);
@@ -2593,11 +2598,6 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 #endif /* CONFIG_GPIOLIB */
 
-	/* Flush the FDB table */
-	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 


