Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14829C54E64
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMY8NVnOF97MA9cY4uKJK6Z1YfV/geMkbCzYeBNB1p0=; b=EIQQOL8XVpKE0DLfUgdLBTb/YI
	fPmUe/edyCRYxVrNapnOO8qTnn/lwuudtuHz0w9NsOG9oLR//UIkXQJLUqMsqum6ZSxXN13QQiwcH
	QirV6PqkOoRm8aECTOJzYVe4Cq+uPhV4J+YQsJs7g1l5o1O/dV5EcgM5CjRc5pkgPREE6tvwnnyvl
	nAcAdA2jI7vHzhI/nndeOMcbRJHrmNndhPyuQ5nVcsi8GWorBBR+CFt2VhChQtiU1tnPH014ajNrz
	Ez8xSiKGjvUpEomJbPdLu0y4HCeLgFqBQ+F9+IewLxgXbn3YpTwXp6KaSHwywckpYHTAYmQxeytKB
	a26lmriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpquG-0000000EMGh-2mcd;
	Thu, 28 Mar 2024 14:39:04 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpquD-0000000EMFT-2WFM
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Mar 2024 14:39:03 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e6b54a28d0so844049b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Mar 2024 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711636736; x=1712241536; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vMY8NVnOF97MA9cY4uKJK6Z1YfV/geMkbCzYeBNB1p0=;
        b=mHd7Q1EZtCcTZcy3vErQdsDIUPikW4dKezGwTNW3/I6iMe3fBhhNLrxnPI2nYTAGXi
         4DJiRgICi1YQHhHxF2rgbvN4JGrqUKnklZZBvu0jVk0pNZDMpNYZDv/JLAachmoaPKLI
         gdQ8IyNnCYDqyF9ln+rMDG5nY0OmL2ROmkUics2NFT5NY0pLYtT2cfUY9PVRXhJ8kvt7
         lRBHyoQOtYHRd8c9Ylg5/EaYSda1XIs56C+FKMTYGGwjQ4SZ2D8y/CguSMIMIMVL17l/
         GrLS9IONti1hMWG/Ts9GAVtIgpAqm7tphpwpf4mh7LtMez6RJUzmQ65CDzH4E11JSZyn
         pmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711636736; x=1712241536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMY8NVnOF97MA9cY4uKJK6Z1YfV/geMkbCzYeBNB1p0=;
        b=FmCLHjwsCfuts7fnXtK1z4EKvtMZ0BroOaU7kBTTTsLau1DG1fe52Vh4VD2bs5NbPm
         /7+np4OK9QDq7VZsdhIlaTtEUSesz7rXCdXkN8oh3SgnN7S0kVt7fJcpI9SuOF4z+7PN
         nYMBpt7IxSkXvqRz2jCaT8jifKuRV7KhvJO9jU9L8Ar8jq8zhqlpoVUUB8EMzC3EiMq6
         cpdBa2aVlhpfrwUekhNDMmzMhajzmkzd5zeqh7sJPIcvTuBSOXVWzYTszR6+9s0WKGta
         SSNpUArE8/xYYqJVdGweFHVnLtLclojZy5zwOKtI9O4zIuAg207n2pmRwQPR7Vym46el
         nf9g==
X-Forwarded-Encrypted: i=1; AJvYcCX2fP0pWTp28b86UXwhLfokXFHEU+5bOWIgz+0tROwPQy5Tm/3Abk/Nn65VG71ATVzQhYcuJFScFYfjSl8ADC48VMdxGTnRFNSUbKguO44aVM/Z
X-Gm-Message-State: AOJu0Yw5c6EutFG38OcO3h/ofSrrMs5yxSqjMGkeHRKk3Ech4Q3j3d5h
	h0IohQOMzEDrSNAZy/KGYrz4SNrACY7jp0QBNGm4l68mddMp51p3GRgDvTfurig=
X-Google-Smtp-Source: AGHT+IHSRHXvmH5VZNmwCTDuXN846Z1hCir5wFWdCEOx0hNfK6aMIMOd1COe/h7RuCB3uRw7DmjA6g==
X-Received: by 2002:a05:6a00:464f:b0:6ea:7b29:3ab7 with SMTP id kp15-20020a056a00464f00b006ea7b293ab7mr3081643pfb.23.1711636736154;
        Thu, 28 Mar 2024 07:38:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff63:c57b:4625:b68c])
        by smtp.gmail.com with ESMTPSA id p43-20020a056a0026eb00b006e6b12d650asm1439220pfw.31.2024.03.28.07.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 07:38:55 -0700 (PDT)
Date: Thu, 28 Mar 2024 08:38:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, matthias.bgg@gmail.com, tzungbi@kernel.org,
	tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	kernel@collabora.com
Subject: Re: [PATCH 2/2] remoteproc: mediatek: Don't parse extraneous
 subnodes for multi-core
Message-ID: <ZgWA/E46i/CaoM74@p14s>
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
 <20240321084614.45253-3-angelogioacchino.delregno@collabora.com>
 <ZfxRyMyUqyqtXy8n@p14s>
 <9ef4e974-740e-4698-bb38-f236521a425c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ef4e974-740e-4698-bb38-f236521a425c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_073901_683701_760D7EAC 
X-CRM114-Status: GOOD (  32.07  )
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

On Wed, Mar 27, 2024 at 01:49:58PM +0100, AngeloGioacchino Del Regno wrote:
> Il 21/03/24 16:27, Mathieu Poirier ha scritto:
> > On Thu, Mar 21, 2024 at 09:46:14AM +0100, AngeloGioacchino Del Regno wrote:
> > > When probing multi-core SCP, this driver is parsing all sub-nodes of
> > > the scp-cluster node, but one of those could be not an actual SCP core
> > > and that would make the entire SCP cluster to fail probing for no good
> > > reason.
> > > 
> > > To fix that, in scp_add_multi_core() treat a subnode as a SCP Core by
> > > parsing only available subnodes having compatible "mediatek,scp-core".
> > > 
> > > Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/remoteproc/mtk_scp.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > > index 67518291a8ad..fbe1c232dae7 100644
> > > --- a/drivers/remoteproc/mtk_scp.c
> > > +++ b/drivers/remoteproc/mtk_scp.c
> > > @@ -1096,6 +1096,9 @@ static int scp_add_multi_core(struct platform_device *pdev,
> > >   	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
> > >   	for_each_available_child_of_node(np, child) {
> > > +		if (!of_device_is_compatible(child, "mediatek,scp-core"))
> > > +			continue;
> > > +
> > 
> > Interesting - what else gets stashed under the remote processor node?  I don't
> > see anything specified in the bindings.
> > 
> 
> Sorry for the late reply - well, in this precise moment in time, upstream,
> nothing yet.
> 
> I have noticed this while debugging some lockups and wanted to move the scp_adsp
> clock controller node as child of the SCP node (as some of those clocks are located
> *into the SCP's CFG register space*, and it's correct for that to be a child as one
> of those do depend on the SCP being up - and I'll spare you the rest) and noticed
> the unexpected behavior, as the SCP driver was treating those as an SCP core.
> 
> There was no kernel panic, but the SCP would fail probing.
> 
> This is anyway a missed requirement ... for platforms that want *both* two SCP
> cores *and* the AudioDSP, as that'd at least be two nodes with the same iostart
> (scp@1072000, clock-controller@1072000), other than the reasons I explained some
> lines back.
> 
> ...and that's why this commit was sent :-)
>

Please update the bindings with the extra clock requirement in your next
revision. 

> P.S.: The reason why platforms don't crash without the scp_adsp clock controller
>       as a child of SCP is that the bootloader is actually doing basic init for
>       the SCP, hence the block is powered on when booting ;-)
> 
> Cheers,
> Angelo
> 
> > Thanks,
> > Mathieu
> > 
> > >   		if (!cluster_of_data[core_id]) {
> > >   			ret = -EINVAL;
> > >   			dev_err(dev, "Not support core %d\n", core_id);
> > > -- 
> > > 2.44.0
> > > 
> 
> 

