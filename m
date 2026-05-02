Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B9ACD3427
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 May 2026 00:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgEc9rsrNwHugfwOJZyA4eeN8ncxb4sCvk2w5A+ata0=; b=SyxbvVErHSkHX9HLFYO5LmRFnb
	Uu33h04Hud40tCaYuUUV/ZRf/GNtzEFZMxJmzbIPXt8i8oF4tVrXr+wPKXAM+ACvBeJi4x45uv0xt
	Cv8QJ/1xieQnhL9DBDMjcpp+GK9NYpXgW9+mJznmG2q8zZnnIC//fkttuLdziHY++eMls/70ssuLD
	fBLK9wvCo7OVEb8s451cz0tL0s+e2Eua+FFC4IiFsXE0KSgYjleTiojB5quU4lRwYsgORXD77lKLQ
	jhEHbc3L6LYnneOUi3c2Lv/aIlUdXW7US2MMsMo24K07asBQWGqE2SoFKpLPzZLJKkOD8fOsWdRwN
	vzVO/4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIy19-00000007tQC-0Im0;
	Sat, 02 May 2026 00:15:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIy17-00000007tPq-1Kun;
	Sat, 02 May 2026 00:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE480600AE;
	Sat,  2 May 2026 00:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788FEC2BCB4;
	Sat,  2 May 2026 00:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777680930;
	bh=1wnHG4DhEEWaHsYbpTUTr9P6ZlzbVGKMECFzT3v6umw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WunWZdIeZJFgZgtbL3geAU1sEoIluVoBwb8CBkaHuPnqzbSukHjdXLDnsn5iqeKFr
	 PVtZMGeJdu8tG10RHBEz+PpDLj6ZH2FOe4gsr8rcXFbZwYcXEL9Bh+Nt7WkNGiM7qp
	 +uLllWxch+WadlDKYMO6NzokyEopRTSUrpbX79CbJMBWPXcGGvK3f3wcCkQPzoI2iq
	 QNxgoN9kbzctoWTPc56Em2hUwRfQigb86qFLgtuyeE/5/GO47XureFsewh7VxS3bc1
	 UZrR1myCgPuew3Tzghum2adGhJEheVzhqtdhDLg06M9Av/PBYzTU/aFgaFVcpTUOMM
	 jJp+sfO+gDLeQ==
From: Jakub Kicinski <kuba@kernel.org>
To: daniel@makrotopia.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	chester.a.unal@arinc9.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux@armlinux.org.uk,
	ansuelsmth@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v5] net: dsa: mt7530: fix .get_stats64 sleeping in atomic context
Date: Fri,  1 May 2026 17:15:27 -0700
Message-ID: <20260502001527.3603463-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <4086098f5333d48221f83fa775607330836336d7.1777590741.git.daniel@makrotopia.org>
References: <4086098f5333d48221f83fa775607330836336d7.1777590741.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
Subject: net: dsa: mt7530: fix .get_stats64 sleeping in atomic context

This patch moves MIB counter reads for MDIO-connected switches into a
self-rearming delayed work, and has .get_stats64 return cached values
under a spinlock. A mod_delayed_work() call on each read triggers an
immediate refresh.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index b9423389c2ef..e769914d726c 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -3137,6 +3187,12 @@ mt753x_setup(struct dsa_switch *ds)
>  	if (ret && priv->irq_domain)
>  		mt7530_free_mdio_irq(priv);
>  
> +	if (!ret && priv->bus) {
> +		mt7530_stats_refresh(priv);
> +		schedule_delayed_work(&priv->stats_work,
> +				      MT7530_STATS_POLL_INTERVAL);
> +	}
> +
>  	return ret;
>  }

Can the delayed work outlive priv on a probe failure path?

mt753x_setup() is installed as ds->ops->setup and is invoked from
dsa_register_switch() via:

  dsa_register_switch()
    dsa_switch_probe()
      dsa_tree_setup()
        dsa_tree_setup_switches()
          dsa_switch_setup()
            ds->ops->setup == mt753x_setup()   /* queues stats_work */
        dsa_tree_setup_ports()                 /* may fail here */
        dsa_tree_setup_conduit()               /* or here */
        dsa_tree_setup_lags()                  /* or here */

If any of the later dsa_tree_setup_* steps fail after mt753x_setup()
has queued stats_work, dsa_tree_teardown_switches() is called, which
invokes ds->ops->teardown per switch. The mt7530 dsa_switch_ops does
not define a .teardown op, so nothing cancels the delayed work.

mt7530_probe() then propagates the error. The driver core does not
invoke .remove() after a failed probe, so mt7530_remove_common()
(which holds the cancel_delayed_work_sync()) never runs. Once
mt7530_probe() returns the error, devres releases priv and priv->ds
while stats_work is still queued. When it fires, mt7530_stats_poll()
dereferences priv, walks priv->ds->dst->ports and issues MDIO reads
via priv->bus on freed memory.

Would it be safer to cancel the work in mt753x_setup()'s own error
path (and/or add a .teardown op) so the work is stopped whenever
setup reports failure?

> @@ -3409,6 +3468,9 @@ mt7530_remove_common(struct mt7530_priv *priv)
>  
>  	dsa_unregister_switch(priv->ds);
>  
> +	if (priv->bus)
> +		cancel_delayed_work_sync(&priv->stats_work);
> +
>  	mutex_destroy(&priv->reg_mutex);
>  }

Is the ordering of dsa_unregister_switch() vs. cancel_delayed_work_sync()
correct here?

dsa_unregister_switch() ends up in dsa_switch_remove():

  net/dsa/dsa.c:
  static void dsa_switch_remove(struct dsa_switch *ds)
  {
        struct dsa_switch_tree *dst = ds->dst;

        dsa_tree_teardown(dst);
        dsa_switch_release_ports(ds);
        dsa_tree_put(dst);
  }

and dsa_switch_release_ports() does list_del + kfree on every
dsa_port entry:

  dsa_switch_for_each_port_safe(dp, next, ds) {
        ...
        list_del(&dp->list);
        kfree(dp);
  }

Meanwhile, mt7530_stats_refresh() iterates the same list without any
locking or RCU:

  dsa_switch_for_each_user_port(dp, priv->ds) {
        port = dp->index;
        mt7530_read_port_stats64(priv, port, &stats);
        ...
  }

and dsa_switch_for_each_user_port expands to a plain
list_for_each_entry over ds->dst->ports.

stats_work rearms itself every MT7530_STATS_POLL_INTERVAL (one
second), and mt7530_get_stats64() can mod_delayed_work(..., 0) it to
fire immediately. With the cancel happening after
dsa_unregister_switch(), the worker can run concurrently with port
teardown and dereference dsa_port entries that have already been
list_del'd and kfree'd, or walk priv->ds->dst after dsa_tree_put()
has released it.

Should cancel_delayed_work_sync(&priv->stats_work) run before
dsa_unregister_switch(), with a guard to prevent mt7530_get_stats64()
from requeuing the work during unregister?
-- 
pw-bot: cr

