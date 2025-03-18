Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063F2C28B28
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Mar 2025 07:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AY4nrcK+Zp55l8IKfUmGd4cDhlQMOGx6qxnOrnPzDs0=; b=eMEkl2p0CdGV+xEweympjHqsIk
	MCjshGmcerbK2Bd1yueGctsEm4XTrXnpBtXVbIxm2+xY28f1QVOdqcqrtWwoxbR8z0JAHPfhK29IN
	GdZh1pX3xM1+UTzGYzfpNnxg4YyAmRvPyioEjKfdABKYoRgAH0EIr4ByCFkKDLdSz6YbfeYucgA2J
	vTbTdh+9RO68W4TzIDKRx+c0cearSVEJl/dQqA4nCdJgOJWPFLRCWpMGnYUN+iSB1hOOBOH+wClbF
	KQO8B8ki98vmPW0Y6Em0vOfMmmRTkVvTSh+QtuDOTAESp4UsTK9zkCVEIC/DhRa1LelC3/TLX8hdy
	yuqlEpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRca-00000004zFW-3rKb;
	Tue, 18 Mar 2025 07:44:20 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRcU-00000004z7y-1wXT
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Mar 2025 07:44:17 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-307c13298eeso60509811fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Mar 2025 00:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742283852; x=1742888652; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY4nrcK+Zp55l8IKfUmGd4cDhlQMOGx6qxnOrnPzDs0=;
        b=UFTNRMDTEGRx8VcvQBGcgxj8eZ62uh0L5DMarQjteWRfUCSAMzEEGS7fRC1c+W46Mx
         DatoafNQpobsFwIE0Ezra2cJ9HU9UMmc98G8jpvITIcKzgOkxkU4hx0P+XGImjq0ffu4
         d5T9GFfnAp0TgQCnUeW8dODGCdq4PYnCLAsg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283852; x=1742888652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AY4nrcK+Zp55l8IKfUmGd4cDhlQMOGx6qxnOrnPzDs0=;
        b=M7Kv0a6EcqKo05os+pGTl+NXDa4ic08yTcAjvlh+dKjR/dFOhduQnDqIDt/ULSV9Bz
         oPqqPlqW84wjwpqND7A4VxIq3T7i5w1o61+n3sWBzVNOdlLtC6tQ1rHfmLPL6fyLT2He
         UgFTn+e6W4IvQDlHhtVfJfXOHvsBPugUNmNGho+WyvMKT56U0eih1TOY+lwAyVxz8+1Q
         TXbnU+ii4icfbmfkkB/Ay+DNG7s2bb1W2mQZcZlD2DZVTybKgDIpHqRXMm4f9FO+cdN/
         N7ZW9fU7xC/BCF0mYSuLlu+mCmQbrS4RtyEc1qeLlmDkKlo5biZNP8XKic6n7pG+yIZA
         Meog==
X-Forwarded-Encrypted: i=1; AJvYcCW5+Dg75JdSWGfAU94+gj2Pwlow2YGOxeYgv46fBLpwjT17ldRaD2WXe+f+4/qusV2a3yAvcgyDBWswzuXoOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2W2/B0iGHu5nHsjJwiUHqeNiz8whZjBd7cmg1+1MhhSgNFVBV
	EC6LrYsGEEBFd3M1zzMKN/D1FnHVt2T77ZhajF4Tq43HGulgyRDd4OopqsHFOirrM6AQyoKotXa
	Z2XY8YNJC6XrT3P+5qm9Pjb1LQ8wsGWG8UFyS
X-Gm-Gg: ASbGnctrVPJNsSvOvLYwS5HARA3sTVPhruDM0mj/eNVNkUL/JwVqefQIvCVOP8PbebJ
	n8gHAxSLFrlHRhC+HjRgZx7v1csGQ63xjJDKz3Yl1bNylKBrWKuzkbfbrKj60c/7CLzYiC4gSI7
	IWtnrH2wNHW73Jm2oSYwP3uKwppIMsJ2TyJ7s2tXJ+cqNcOY+nS2R4IA==
X-Google-Smtp-Source: AGHT+IF+773ci4UoV+sGzHQYu4ESZ9jtnDsvpdSF2LHhzTO4GxyVaJ4Tz3KvEFLSLVW7uYN+ywJG4Jl3VDfydU66Nlg=
X-Received: by 2002:a05:651c:1a0a:b0:308:ee65:7f44 with SMTP id
 38308e7fff4ca-30cd95ccf10mr18564791fa.8.1742283851907; Tue, 18 Mar 2025
 00:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250317083822.891-1-jjian.zhou@mediatek.com> <375d5281-41f5-49e8-ac20-d58931c0c1f9@collabora.com>
In-Reply-To: <375d5281-41f5-49e8-ac20-d58931c0c1f9@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Mar 2025 15:44:00 +0800
X-Gm-Features: AQ5f1JoL_4-3vsBbckwxOs1U7jI_JX94-Mf3iV6qaZp6QY7f8KVlHZilsseLfY4
Message-ID: <CAGXv+5G4KRbv=qcKurn5u300XPp4KNovmUD9OBfX7mKk57tucg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/3] add VCP mailbox and IPC driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jjian Zhou <jjian.zhou@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_004414_522013_D26950CE 
X-CRM114-Status: GOOD (  36.03  )
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

On Mon, Mar 17, 2025 at 6:07=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 17/03/25 09:38, Jjian Zhou ha scritto:
> > The VCP mailbox has 5 groups. Each group has corresponding interrupts,
> > registers, and 64 slots (each slot is 4 bytes). Since different feature=
s
> > share one of the mailbox groups, the VCP mailbox needs to establish a
> > send table and a receive table. The send table is used to record the
> > feature ID, mailbox ID, and the number of slots occupied. The receive t=
able
> > is used to record the feature ID, mailbox ID, the number of slots occup=
ied,
> > and the receive options. The API setup_mbox_table in mtk-vcp-ipc.c calc=
ulates
> > the slot offset and pin index for each feature ID based on the mailbox =
ID and
> > slot number in the send and receive tables (several slots form a pin, a=
nd
> > each pin can trigger an interrupt). These descriptions are written in t=
he
> > mtk-vcp-ipc.c file -- we call it the IPC layer.
> >
> > We have two questions:
> > How should we describe the mailbox and IPI?
> > Can the intermediate IPC layer be rewritten as a virtual mailbox layer?
> >
>
> So, for this remote processor messaging system you have:
>   - Dynamic channel allocation
>     - Each channel has its own endpoint

The rpmsg model has:

- device -> the remote processor
- channel
- endpoint

However here for the VCP and possibly all the coprocessors using the
tinysys model, channel and endpoint are basically the same. If we
consider the "channel" to be the storage plus the interrupt vector,
and the "endpoint" to be the function running on the remote processor
servicing a given IPI ID, then it's always one endpoint per channel.

IMHO rpmsg gives too much latitude to make things confusing here.

rpmsg also requires the remote processor to support name service
announcements, which really doesn't exist. The endpoints and how
they map to the various hardware mailbox interrupt vectors and
storage is statically allocated, and thus needs to be described
in the driver.

>     - Each channel has its own interrupt
>   - Data send operation
>     - Both with and without ACK indication from the remote processor
>     - To channel -> endpoint
>   - Data receive operation
>     - From channel <- endpoint
>     - When interrupt fires
>     - Could use polling to avoid blocking in a few cases
>   - A custom message structure not adhering to any standard
>
> Check drivers/rpmsg/ :-)

While discussing this internally, I felt like that wasn't a really
correct model. IIUC rpmsg was first created to allow userspace to
pass messages to the remote processor. Then somehow devices were
being created on top of those channels.

Also, the existing mtk_rpmsg driver seemed a bit weird, like requiring
a DT node for each rpmsg endpoint.

That's why I thought mailboxes made more sense, as the terminology mapped
better. As a result I never brought up rpmsg in the discussion.

Perhaps that could be improved with better documentation for the MediaTek
specific implementation.

> On MediaTek platforms, there are many IPI to handle in many subsystems fo=
r
> all of the remote processors that are integrated in the SoC and, at this
> point, you might as well just aggregate all of the inter processor commun=
ication
> stuff in one place, having an API that is made just exactly for that, ins=
tead
> of keeping to duplicate the IPI stuff over and over (and yes I know that =
for each
> remote processor the TX/RX is slightly different).
>
> If you aggregate the IPI messaging in one place, maintenance is going to =
be easier,
> and we stop getting duplication... more or less like it was done with the=
 mtk_scp
> IPI and mtk-vcodec .. and that's also something that is partially handled=
 as RPMSG
> because, well, it is a remote processor messaging driver.
>
> Just to make people understand *how heavily* MediaTek SoCs rely on IPI, t=
here's
> a *partial* list of SoC IPs that use IPI communcation:
>
> thermal, ccu, ccd, tinysys, vcp, atsp, sspm, slbc, mcupm, npu, mvpu, aps,=
 mdla,
> qos, audio, cm_mgr.... and... again, it's a partial list!

Indeed, the newest chip has become quite complicated.

> That said... any other opinion from anyone else?

I tried to describe why I thought a virtual mailbox was better.


Thanks
ChenYu

> Cheers,
> Angelo
>
> > Example of send and recve table:
> > Operation | mbox_id | ipi_id | msg_size | align_size | slot_ofs | pin_i=
ndex |  notes
> > send          0          0       18          18           0          0
> > recv          0          1       18          18          18          9
> > send          1         15        8           8           0          0
> > send          1         16       18          18           8          4
> > send          1          9        2           2          26         13
> > recv          1         15        8           8          28         14 =
      ack of send ipi_id=3D15
> > recv          1         17       18          18          36         18
> > recv          1         10        2           2          54         27 =
      ack of send ipi_id=3D2
> > send          2         11       18          18           0          0
> > send          2          2        2           2          18          9
> > send          2          3        3           4          20         10
> > send          2         32        2           2          24         12
> > recv          2         12       18          18          26         13
> > recv          2          5        1           2          44         22
> > recv          2          2        1           2          46         23
> >
> > Recv ipi_id=3D2 is the ack of send ipi_id=3D2(The ipi_id=3D15 is the sa=
me.)
> >
> > Jjian Zhou (3):
> >    mailbox: mediatek: Add mtk-vcp-mailbox driver
> >    firmware: mediatek: Add vcp ipc protocol interface
> >    dt-bindings: mailbox: mtk,vcp-mbox: add mtk vcp-mbox document
> >
> >   .../bindings/mailbox/mtk,mt8196-vcp-mbox.yaml |  49 ++
> >   drivers/firmware/Kconfig                      |   9 +
> >   drivers/firmware/Makefile                     |   1 +
> >   drivers/firmware/mtk-vcp-ipc.c                | 481 +++++++++++++++++=
+
> >   drivers/mailbox/Kconfig                       |   9 +
> >   drivers/mailbox/Makefile                      |   2 +
> >   drivers/mailbox/mtk-vcp-mailbox.c             | 179 +++++++
> >   include/linux/firmware/mediatek/mtk-vcp-ipc.h | 151 ++++++
> >   include/linux/mailbox/mtk-vcp-mailbox.h       |  34 ++
> >   9 files changed, 915 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,mt81=
96-vcp-mbox.yaml
> >   create mode 100644 drivers/firmware/mtk-vcp-ipc.c
> >   create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
> >   create mode 100644 include/linux/firmware/mediatek/mtk-vcp-ipc.h
> >   create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h
> >
>
>
>

