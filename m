Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3B8C982ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=; b=q3oAjPQ9G5zQF7N/60Yzn1hQn2
	Fj8Wu2G/p67cQHSCsHxsdVRhxMnpXKrfTqhm0HVJo6uVFkkJeFakxp1/a2Kqvp683AfPTVHRKBed7
	bpFNvhknW2gAqHjRp8OAVISR6KHEmy3FUYta+FhDTjGPxTaRFz6Iu8brfRqt1NEPht4HsJFB+H9Rb
	A7c+4gIxjoudwlhBOyeqPzwug/kYHrdwD+EZcP0j3r1fgJVj6J7aNdQx+p4FRmDzZnTVvasXWiD+S
	ryqFvHILrGixj7WmufFxXjyeY1WfHqdFAM8g+SDT3xPfw57Rs8qxsm1kMt5PX9V+N4Y3l78Oi2qXm
	ZspqccuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f8K-00000002Q1z-2anX;
	Mon, 21 Sep 2026 14:36:40 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f8I-00000002Q03-1iGS
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 14:36:39 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66e4ab19127so3160479d50.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 07:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001397; cv=none;
        d=google.com; s=arc-20260327;
        b=PBPPhqJH7IvvP36br1gygVyFQoIE1SBp1hXJD4+NA4PxLTR67/gb13vML0vlq0EJ5J
         0eug8YMVZjkyhO9B/H8SBH5XviBZmHJ3ECImNDI23Lgj4M2X+kOlYBTvWPswm0KqEqU6
         WpwYkntAljuBYwhOnDVgGNK8YtxaP9D7W8W1MAijdOCBYeisdLJCrzs38g4B2ThpKbFM
         sdixCcfr04ygPCZCCL3Ar0HSBRMbnYUXQuxnvX5th8ML0nZIwD4wTcYy7sqSoBCLft2W
         NoQacC39fMUYSe6X51VfmZRFRi6CImQRqA+/E93+GSzIlymf2m+OyuPKpoSYhBvzQSNa
         6+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=;
        fh=cL+m7k4zy03vLoYBjheOrAhASCvB9btUgcVLVaMvlL8=;
        b=ef1fuEM58fm3QMYVh0UFEoTrpj1Gio3I8M1/cgksxXqXwNHDknsnMLksYglVRPhpqk
         ZlDmqvx5t3j43l7Au3vZVtJoTuTlLdaOOmsugokX1o/I3eBwRprMa9DbnhLcrYQg6qey
         inTvnMAXKO7FyvYegGAUiNzv88kHO1Gz8USpKVCiu6fchQLy8DrvYVNlX9WOrFbCgUN7
         Xk5kW2QNl02KOxOXXxuBa/U+PYfiMrSlzgiJWB9wcoQDlboYdX9otHB8D4hF+vVlDpyt
         yEPpF3RG0RMEmpU+B+Z8wGm0IRFJWv9LS/1jPDUWIJg9/ckV5sd4c4vsrw2H9W4Haye4
         1nKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790001397; x=1790606197; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=;
        b=spJfJhVahikKdYDpXnybtOnYnkG9Obc2IN5NskE6lg62Rqia5RtogAzJjwXUWzYdvZ
         ukVjCHcIBMMXOp5XBdiwYxDa0DocNysRd+ytf89/w1HWCsHgxzGdaWf5H4tSeyRnwFGy
         tfkg8xnlihkulZJzq9YOEcUHeymvtgWC+wmyxRNYG1YSUuHAfjEL4bezf4Z+2pKc0eL/
         du24bSsq6efo5HzOVByYqk5nW6AezgG22lNBpDp9Mo0KzdWfLhWfY+ylehQwq+1npOlA
         Stbw20f167TJb28yFWPawShobI1qT0CuI2ipEvcKJxuMzAnRCr5XFTh0QiO8aAUX+agw
         Eg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001397; x=1790606197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=;
        b=nIZqPv8EzApn2YvN+jl12Z3b/RgAovsjvuYMQ1PjcE5LeomOGT/okfGM1dyPmUCgrc
         eJZwzknjQaII4YkHrPtX456rlqKcaG3H3EAqKw5Vo8OzK0GbKsD50SATsl1398mBQdC3
         qdjyGfjYtnQc1yyQuF9NCEAxGn+rs5pF+xuJOWthg63ByU235xNIOfKwlDaWnyB2Z1mE
         v1mfX20TJLzj3U9/yHFPVKoyulx7EsVTndLcl/PTfGQQiIDoXJpruTgVJgqw5KwwUEL0
         smjMllfD5Arx2TETIwduX3Tkrwztt+JMGe2t1CIrBgKfr9X0HcX9iU0yQQIXZJDbpN3A
         yiOA==
X-Forwarded-Encrypted: i=1; AKwUvBxk7pXcUT3Xp2EgqysjvnPFeyLC65nlRZL4Wz81IVyIraI37aR3dpuAyCE4d1I9GftGhGtz5AGKdghagQGSoQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mkmhEmC9a3wLHs/F79VXJaWV+7Aeb2HVCaiBTViXgT6YXDD3e9
	ebg2MfMBSh06PQhwLKriELmF03Y8xAWlV9Q4JSGTjBRStwmR6IoCXmFWXKRrnBA8gH5dFzK+dIy
	/bWfmEvoyl2Old/dGIJs3SKPEa1/5YIY=
X-Gm-Gg: AYBFou0blkunG4q8gTA1v1bmTogTYz+eoKNdgL/rJbsnJHKQSLjFOGgKXTdoOzZPjT6
	tWE7nU8RoyuBChFdU2s/B5xQlIsqoAhjYDBo+kuKUQQ2A7Fq7lvW+UoV5IXLinL3S9ySkJV5sqN
	OpBMUgos2BsTTwauj8WAIU1k/1VRT7JvRkiEobe/hzH43I7DaRwtdnu0a3aIEI2EOqPuDFKBSC5
	yBa+PM7CPnQM5FuDeXFwjwaWkTS9RmWviGbtMf8YiRplFvWz8JJeCjc/GN0lEkA7Slx9tLwBppA
	TcL2KyWnHKS1fm7rSuaQmeGrB5t/l1JjSYXg7X/NoUpsXXzthZKxz+MTTw==
X-Received: by 2002:a05:690e:43cf:b0:66f:ac49:a27a with SMTP id
 956f58d0204a3-6717fc65521mr2383542d50.14.1790001396949; Mon, 21 Sep 2026
 07:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260916051618.2904439-1-lgs201920130244@gmail.com> <178962811102.1264013.13698060411191875408@gmail.com>
In-Reply-To: <178962811102.1264013.13698060411191875408@gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 21 Sep 2026 22:36:24 +0800
X-Gm-Features: AcwNN1VX0XaLkydRZySUPzjNak9mjroYac8VQM-fZ7BBkk7Judurvc9M8LXCNAM
Message-ID: <CANUHTR9Csn86KgVMTCBPBobAjg78-M3TR1VTz--yLyG74w6YbQ@mail.gmail.com>
Subject: Re: [PATCH] net: mediatek: fix PPE resource leak on remove
To: Wayen Yan <win847@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_073638_463426_89BF7C10 
X-CRM114-Status: GOOD (  23.59  )
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

Hi Wayen,

Thanks for the detailed review.

On Thu, 17 Sept 2026 at 14:55, Wayen Yan <win847@gmail.com> wrote:
>
> Hi Guangshuo,
>
> Thanks for the patch. Calling mtk_ppe_deinit() from the remove path is
> the right direction, since the probe error path already tears PPE down
> but the successful remove path currently does not.
>
> However, I think the cleanup is still incomplete.
>
> mtk_ppe_deinit() currently only destroys the per-PPE l2_flows
> rhashtable:
>
>     rhashtable_destroy(&eth->ppe[i]->l2_flows);
>
> This only destroys the hash table itself. It does not free any entries
> that may still be stored in it. In this driver, L2 offload entries are
> struct mtk_flow_entry objects allocated by mtk_flow_offload_replace()
> and inserted into eth->flow_table, and bridge/L2 entries are also
> indexed from ppe->l2_flows via mtk_foe_entry_commit_l2().
>
> There is also a lifetime mismatch for eth->flow_table:
> mtk_eth_offload_init() initializes it, but I do not see a matching
> destroy/free on the remove path.
>
> So I think remove should first drain the offload flow entries, using the
> same per-entry teardown as mtk_flow_offload_destroy():
>
>     mtk_foe_entry_clear(...)
>     mtk_wed_flow_remove(...) when needed
>     kfree(entry)
>
> and then destroy eth->flow_table and the per-PPE l2_flows tables.
> rhashtable_free_and_destroy() with a small callback would probably fit
> this better than plain rhashtable_destroy().
>
> While touching mtk_ppe_deinit(), it would also be better to use continue
> instead of return for missing PPE instances, so later PPE instances are
> not skipped.
>
> One more minor cleanup issue: mtk_ppe_debugfs_init() creates the ppe%d
> debugfs directory, but the PPE teardown path does not remove it.
>
> So I agree with the fix direction, but I think this should be respun as
> a complete PPE/offload cleanup rather than only adding mtk_ppe_deinit()
> to mtk_remove().
>
> Thanks,
> Wayen
>
Agreed. I'll extend the cleanup to drain eth->flow_table with
rhashtable_free_and_destroy(), using the same per-entry teardown as the
normal flow destroy path, then remove the PPE debugfs entries and destroy
the per-PPE l2_flows tables.

I'll also make mtk_ppe_deinit() continue past missing PPE instances and
send a v2 with these changes.

Thanks,
Guangshuo

