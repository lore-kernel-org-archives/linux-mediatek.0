Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5925CC38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 13:38:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2483D20870
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 13:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZwYP12Qv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSG964ej"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2483D20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+NkxXhXl4Ci8Qdc705rO6AknzA5nJZPxg9WB/CdBLTg=; b=ZwYP12QvPkXI1h
	E71hqtk/f85dnVPR61DUpovSKAMCyQPCtP5C/wXYeyqm9ky72npNFwB8+r3wPGJHpB/AXBv/OOlU2
	fZpW/TXeD84ZSY+p9NxOxke+/dzhM37mS95xc2r1NyAJ1rHNEp4dWfNvN9FqzvDxViH/p4Iv9mYwI
	im9aE7V9xOlV5/A0nhi0F9x9HulkxP7zziYvvpJbcz5/OA5Z1CgOQZyqCutHGWMHhLcFjdB3n9GJ9
	EATZzGDxp7o3V6wA7JBR3CczBhDUglvDmuMaLyWGUphgel2D5Wy0pLUnc62Pac0dAy2dzuXzwsiwD
	Nycb7lhGHhGxcz7sZbrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWgjI-0002wu-6Q; Thu, 07 May 2020 13:38:24 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWgjE-0002vf-T1; Thu, 07 May 2020 13:38:22 +0000
Received: by mail-qk1-x744.google.com with SMTP id s9so5983630qkm.6;
 Thu, 07 May 2020 06:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XyFI/0glapYRDGb+UZNlPaGXtG4FI3xfYMk/aRCSrjA=;
 b=mSG964ejBYHNuzz1RO5rF48xX1pNQW8dKDVU0mz7T5HLUYpCi+toCow5ONONXrhM5Q
 LmkkSGXRsdvw0WOjCUandtYXnOwS0jB1fdumtzlEr+yJbKwjR0AXv/J0EiBxdJsK4q/l
 JfWJuFSxXSUTXGLXiBxCL+Y8LHGNkuynZVeMKqumVixGSn5KedI6swHJbXFTlh22HjTy
 Ouu/SfcRKpWNnwhvyGwH1n9Fwb1ZYwJKnEcaut38C7cjl9hCynWT1qog9M6gbRYHrX1R
 DtDlaIiCLW4c6TzevLt+22mCTmPCZCgqelsn+Px1IBplE05lf3zeKSsVNKmh3ChbpAQJ
 uwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XyFI/0glapYRDGb+UZNlPaGXtG4FI3xfYMk/aRCSrjA=;
 b=pvaZjtUTB60w7dJi794YnI0uIyhJ3Ovb4GH9O4UnLeu8j6mtIMstJXckNOZXYzohMr
 nRwTBkb37YbmvOj9NCqAFJq17CKvNRu07diPruKEiJkhONUwR3KxhIP+/5dHr+HmGRWN
 uZFy6PPsZc9VzaG7YxfnA5jWjbQFSn2dNczIZ7wJUqwhrul1kqomcWG3Gh0h7MFGqhav
 eD7SzHsTtx1dYxMcSklndoC+AjTSrnxVYS0lWsmjA+4D+MILwg3Fb5yD7iNz+2l3oh1z
 TTHBQpHibAd9apP9SSSw00Uue5S272xrJRhkSXM8e9Du88c7ZidRodS1mnEjLFMwuS0Y
 EFbA==
X-Gm-Message-State: AGi0PuZv3PRw5k8/G+hV9qoPfte+Wg/lkpvQU551PHF6V73rUbphxlyf
 epFagJtf4SPqUkORgkkZI0FXf5JOC3Zbc5jsBBs=
X-Google-Smtp-Source: APiQypIrNb7FlF97rUPM9KNAnReaMLqOOAfKivvLTFaiEKleM2Vyad8arbug4oxzX8DnMN4JAcBzXL48hFEkwoQQ06k=
X-Received: by 2002:a37:6f47:: with SMTP id k68mr14788877qkc.341.1588858696995; 
 Thu, 07 May 2020 06:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200507102345.81849-1-eizan@chromium.org>
 <20200507202337.v3.5.I1c85bddc262913b8572d892dd6bf9bc03fbe0ec7@changeid>
In-Reply-To: <20200507202337.v3.5.I1c85bddc262913b8572d892dd6bf9bc03fbe0ec7@changeid>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 7 May 2020 15:38:05 +0200
Message-ID: <CAFqH_52m9b-7LLTTyXS5UB4wR4x6fzx2uQ3P5Rkj41aOy3mrdQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] [media] mtk-mdp: Remove mtk_mdp_comp.id and
 supporting functionality
To: Eizan Miyamoto <eizan@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_063820_961736_B7D98DE9 
X-CRM114-Status: GOOD (  20.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, Houlong Wei <houlong.wei@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Eizan,

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dj., 7 de maig
2020 a les 12:26:
>
> Since components are registered in a list, the numeric component id that
> specified a location in an array is not necessary.
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>

It looks good to me, so

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>
> Changes in v3:
> - Removed extra Signed-off-by: tag from commit messages.
> - Removed extra line break in mtk_mdp_core.c
> - Update cover letter with dependent commit
>
> Changes in v2:
> - rebase onto linux-next/master to pick up
>   757570f11fa4b0ce5472a6583de6f06e996a8527
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 60 +++----------------
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 19 +-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  9 +--
>  3 files changed, 10 insertions(+), 78 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index da2bdad7a8d1..362fff924aef 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -14,46 +14,6 @@
>  #include "mtk_mdp_comp.h"
>
>
> -static const char * const mtk_mdp_comp_stem[MTK_MDP_COMP_TYPE_MAX] = {
> -       "mdp-rdma",
> -       "mdp-rsz",
> -       "mdp-wdma",
> -       "mdp-wrot",
> -};
> -
> -struct mtk_mdp_comp_match {
> -       enum mtk_mdp_comp_type type;
> -       int alias_id;
> -};
> -
> -static const struct mtk_mdp_comp_match mtk_mdp_matches[MTK_MDP_COMP_ID_MAX] = {
> -       { MTK_MDP_RDMA, 0 },
> -       { MTK_MDP_RDMA, 1 },
> -       { MTK_MDP_RSZ,  0 },
> -       { MTK_MDP_RSZ,  1 },
> -       { MTK_MDP_RSZ,  2 },
> -       { MTK_MDP_WDMA, 0 },
> -       { MTK_MDP_WROT, 0 },
> -       { MTK_MDP_WROT, 1 },
> -};
> -
> -int mtk_mdp_comp_get_id(struct device *dev, struct device_node *node,
> -                       enum mtk_mdp_comp_type comp_type)
> -{
> -       int id = of_alias_get_id(node, mtk_mdp_comp_stem[comp_type]);
> -       int i;
> -
> -       for (i = 0; i < ARRAY_SIZE(mtk_mdp_matches); i++) {
> -               if (comp_type == mtk_mdp_matches[i].type &&
> -                   id == mtk_mdp_matches[i].alias_id)
> -                       return i;
> -       }
> -
> -       dev_err(dev, "Failed to get id. type: %d, id: %d\n", comp_type, id);
> -
> -       return -EINVAL;
> -}
> -
>  void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>  {
>         int i, err;
> @@ -62,8 +22,8 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>                 err = mtk_smi_larb_get(comp->larb_dev);
>                 if (err)
>                         dev_err(dev,
> -                               "failed to get larb, err %d. type:%d id:%d\n",
> -                               err, comp->type, comp->id);
> +                               "failed to get larb, err %d. type:%d\n",
> +                               err, comp->type);
>         }
>
>         for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
> @@ -72,8 +32,8 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>                 err = clk_prepare_enable(comp->clk[i]);
>                 if (err)
>                         dev_err(dev,
> -                       "failed to enable clock, err %d. type:%d id:%d i:%d\n",
> -                               err, comp->type, comp->id, i);
> +                       "failed to enable clock, err %d. type:%d i:%d\n",
> +                               err, comp->type, i);
>         }
>  }
>
> @@ -92,21 +52,15 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
>  }
>
>  int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
> -                     struct mtk_mdp_comp *comp, enum mtk_mdp_comp_id comp_id)
> +                     struct mtk_mdp_comp *comp,
> +                     enum mtk_mdp_comp_type comp_type)
>  {
>         struct device_node *larb_node;
>         struct platform_device *larb_pdev;
>         int i;
>
> -       if (comp_id < 0 || comp_id >= MTK_MDP_COMP_ID_MAX) {
> -               dev_err(dev, "Invalid comp_id %d\n", comp_id);
> -               return -EINVAL;
> -       }
> -
> -       INIT_LIST_HEAD(&comp->node);
>         comp->dev_node = of_node_get(node);
> -       comp->id = comp_id;
> -       comp->type = mtk_mdp_matches[comp_id].type;
> +       comp->type = comp_type;
>
>         for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>                 comp->clk[i] = of_clk_get(node, i);
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 1f745891c6c3..1bf0242cce46 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -22,18 +22,6 @@ enum mtk_mdp_comp_type {
>         MTK_MDP_COMP_TYPE_MAX,
>  };
>
> -enum mtk_mdp_comp_id {
> -       MTK_MDP_COMP_RDMA0,
> -       MTK_MDP_COMP_RDMA1,
> -       MTK_MDP_COMP_RSZ0,
> -       MTK_MDP_COMP_RSZ1,
> -       MTK_MDP_COMP_RSZ2,
> -       MTK_MDP_COMP_WDMA,
> -       MTK_MDP_COMP_WROT0,
> -       MTK_MDP_COMP_WROT1,
> -       MTK_MDP_COMP_ID_MAX,
> -};
> -
>  /**
>   * struct mtk_mdp_comp - the MDP's function component data
>   * @node:      list node to track sibing MDP components
> @@ -41,7 +29,6 @@ enum mtk_mdp_comp_id {
>   * @clk:       clocks required for component
>   * @larb_dev:  SMI device required for component
>   * @type:      component type
> - * @id:                component ID
>   */
>  struct mtk_mdp_comp {
>         struct list_head        node;
> @@ -49,14 +36,12 @@ struct mtk_mdp_comp {
>         struct clk              *clk[2];
>         struct device           *larb_dev;
>         enum mtk_mdp_comp_type  type;
> -       enum mtk_mdp_comp_id    id;
>  };
>
>  int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
> -                     struct mtk_mdp_comp *comp, enum mtk_mdp_comp_id comp_id);
> +                     struct mtk_mdp_comp *comp,
> +                     enum mtk_mdp_comp_type comp_type);
>  void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp);
> -int mtk_mdp_comp_get_id(struct device *dev, struct device_node *node,
> -                       enum mtk_mdp_comp_type comp_type);
>  void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
>  void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 40b9fda8b03b..f96c8b3bf861 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -137,7 +137,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>         for_each_child_of_node(parent, node) {
>                 const struct of_device_id *of_id;
>                 enum mtk_mdp_comp_type comp_type;
> -               int comp_id;
>
>                 of_id = of_match_node(mtk_mdp_comp_dt_ids, node);
>                 if (!of_id)
> @@ -150,12 +149,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>                 }
>
>                 comp_type = (enum mtk_mdp_comp_type)of_id->data;
> -               comp_id = mtk_mdp_comp_get_id(dev, node, comp_type);
> -               if (comp_id < 0) {
> -                       dev_warn(dev, "Skipping unknown component %pOF\n",
> -                                node);
> -                       continue;
> -               }
>
>                 comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
>                 if (!comp) {
> @@ -164,7 +157,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>                         goto err_comp;
>                 }
>
> -               ret = mtk_mdp_comp_init(dev, node, comp, comp_id);
> +               ret = mtk_mdp_comp_init(dev, node, comp, comp_type);
>                 if (ret) {
>                         of_node_put(node);
>                         goto err_comp;
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
