Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC5BC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgJqRt3TsVpHWSIpSeQO37LB+pyModJnVn2ogzISouE=; b=h7QRhJ+3gOZdoq/jwOWceV8fqn
	WjKeubJ9i7m2EqEfNMKeaP8GijNoG31tJ59qILE//VRaxwTrnrP6WZl0X4v6g6i7+qR4MXiy6HKRg
	pcFfMb43K2pYXL5V0/3Li9vT6QMU9CDALxn8KHkYl7nuulgqIF0wm1Sa7Qkd7Wy4+G+V0qBGK0cS5
	AjJqh/4AwE2JItRDmN+/KATKW5hobSZeoRQKhjUxqZ5v+U/84QHkkKky4tc1OZpvA7j4xdI48ubC3
	6vTYRS53t3JuRfTxBcPW0oKYHw/b5GsHje/5hNC8zqOV34/yIxXrsw30gaE/I11f3F9//W8HNOQwy
	JT8KZ7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrf3J-0000000BYnl-0IdI;
	Tue, 02 Apr 2024 14:23:53 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrf3E-0000000BYlp-2Jsz
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 14:23:50 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d71765d3e1so52990261fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712067825; x=1712672625; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PgJqRt3TsVpHWSIpSeQO37LB+pyModJnVn2ogzISouE=;
        b=HkG8YJkVG9NVca+DeFVHbLTIzvm9ylQuQlVkNFqPdCpjLHMdm+FZYEbYZayKa0NuHd
         /QOOBau6P9Qg3PUNivjvwybjJ8zTU4MMesdNE35Fr8iYjxZwYZBKnTR1L6d1IMITTjSC
         JDwgSe0SHqP6E8inBo2VyHFfekkzOzWaG8Y0nEvhlxuOIhFqqNZvVwRRy/9FHr+CtvS0
         UIVeKicWye/g6HebVGyusiM6jvkBwTT6nTg+oqklqKu2GL/Jn8G11z6tWo/VX8b1JmfR
         9AD3y2rU3Av0KFwvENuaTMx+ZJjsttlQZQ2GR3plTtrS0zgin9/zjaRR962t8pdt4Q6F
         hPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712067825; x=1712672625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgJqRt3TsVpHWSIpSeQO37LB+pyModJnVn2ogzISouE=;
        b=PMpCQFSXbmGJTLVfwUiG/6CQHzYec6omPOwU4KRG3OEJd0DQpA4FDoeG8iHSvIl1ub
         BRCbqoM8tNFUFxoLLKx5YGqPNRoI69/HreC842luf/KZVy+jPzMPCEfsAbdnEUZJuZCp
         lnRAFkLSIEqVrg6gOjUYBHdXtHvvW729bD6U62OCKpC53m7G8rAJelm1LvJQLqb9edYR
         wMhVbem0EEdlIOFsJPVVzIvXHOV3fQEAsu4q4o7oHHnSnBki3w9SWIcuDJsqFnGkbNuy
         A0TVkPfoCsSOnSTRZ6Ghn+Z795BHu1ctqPWwditDGFM+i5XDtO6ZYk8CeCxWhUHO0L8g
         mVOA==
X-Forwarded-Encrypted: i=1; AJvYcCWW6eGClevd+Ahu+NAGXP1TqZcL/i0SwOkq7bVLZDZFoH+iRdJ/t+IZSnt9iJuotDSgvzmskGnnZb7dlK5mfcbdMau7XmwOhjRH1ICubLG0TAup
X-Gm-Message-State: AOJu0YyUhpERdEZYHFx9S47k7P/2e2doLOP7+LCk2NhbZhiE9EWoeJqr
	kANKUTlVzP5sXSTuN/b33/3e7JykYXPyJDFjS4rvO+B0CpvsmnNTLbbkS5xpqKSepcF9GOeOFjx
	vm/4cjLOOSxk/oe9iCR7rt1whDUsr62F1sEgYiQ==
X-Google-Smtp-Source: AGHT+IG/G8Z0PqvnCWP/jltJ6TyZ4Zvc6O/H5tBwxhHxT81LMQPHAnYZYFzuLtjTF9MVvIpB/9P9hN/Ud8PcV0sKnEQ=
X-Received: by 2002:a2e:8699:0:b0:2d4:6815:fc6f with SMTP id
 l25-20020a2e8699000000b002d46815fc6fmr7584552lji.30.1712067825431; Tue, 02
 Apr 2024 07:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
 <20240321084614.45253-3-angelogioacchino.delregno@collabora.com>
 <ZfxRyMyUqyqtXy8n@p14s> <9ef4e974-740e-4698-bb38-f236521a425c@collabora.com>
 <ZgWA/E46i/CaoM74@p14s> <b6ed8710-1608-4343-8a58-5f8e0e16d10d@collabora.com>
In-Reply-To: <b6ed8710-1608-4343-8a58-5f8e0e16d10d@collabora.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 2 Apr 2024 08:23:34 -0600
Message-ID: <CANLsYkyu69Pwv094XGfVomuu1Oixw3vxr42q6WOE4F3snATygw@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: mediatek: Don't parse extraneous subnodes
 for multi-core
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, matthias.bgg@gmail.com, tzungbi@kernel.org, 
	tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, wenst@chromium.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_072348_667252_22005B48 
X-CRM114-Status: GOOD (  30.39  )
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

On Tue, 2 Apr 2024 at 03:56, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 28/03/24 15:38, Mathieu Poirier ha scritto:
> > On Wed, Mar 27, 2024 at 01:49:58PM +0100, AngeloGioacchino Del Regno wrote:
> >> Il 21/03/24 16:27, Mathieu Poirier ha scritto:
> >>> On Thu, Mar 21, 2024 at 09:46:14AM +0100, AngeloGioacchino Del Regno wrote:
> >>>> When probing multi-core SCP, this driver is parsing all sub-nodes of
> >>>> the scp-cluster node, but one of those could be not an actual SCP core
> >>>> and that would make the entire SCP cluster to fail probing for no good
> >>>> reason.
> >>>>
> >>>> To fix that, in scp_add_multi_core() treat a subnode as a SCP Core by
> >>>> parsing only available subnodes having compatible "mediatek,scp-core".
> >>>>
> >>>> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
> >>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >>>> ---
> >>>>    drivers/remoteproc/mtk_scp.c | 3 +++
> >>>>    1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> >>>> index 67518291a8ad..fbe1c232dae7 100644
> >>>> --- a/drivers/remoteproc/mtk_scp.c
> >>>> +++ b/drivers/remoteproc/mtk_scp.c
> >>>> @@ -1096,6 +1096,9 @@ static int scp_add_multi_core(struct platform_device *pdev,
> >>>>            cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
> >>>>            for_each_available_child_of_node(np, child) {
> >>>> +          if (!of_device_is_compatible(child, "mediatek,scp-core"))
> >>>> +                  continue;
> >>>> +
> >>>
> >>> Interesting - what else gets stashed under the remote processor node?  I don't
> >>> see anything specified in the bindings.
> >>>
> >>
> >> Sorry for the late reply - well, in this precise moment in time, upstream,
> >> nothing yet.
> >>
> >> I have noticed this while debugging some lockups and wanted to move the scp_adsp
> >> clock controller node as child of the SCP node (as some of those clocks are located
> >> *into the SCP's CFG register space*, and it's correct for that to be a child as one
> >> of those do depend on the SCP being up - and I'll spare you the rest) and noticed
> >> the unexpected behavior, as the SCP driver was treating those as an SCP core.
> >>
> >> There was no kernel panic, but the SCP would fail probing.
> >>
> >> This is anyway a missed requirement ... for platforms that want *both* two SCP
> >> cores *and* the AudioDSP, as that'd at least be two nodes with the same iostart
> >> (scp@1072000, clock-controller@1072000), other than the reasons I explained some
> >> lines back.
> >>
> >> ...and that's why this commit was sent :-)
> >>
> >
> > Please update the bindings with the extra clock requirement in your next
> > revision.
> >
>
> Ok.
>
> Can you please take only patch 1/2 of this series so that I can delay this one
> for a bit? I don't have time to work on that exactly right now.
>

It was added to rproc-next last week.

> Thanks,
> Angelo
>
>

