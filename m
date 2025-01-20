Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A2EC02188
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2025 06:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNXo4WaOxS///tBpR9StPLUAZBNZkjfmled10g42wXE=; b=mKWvstoZl7g2i03VVG5mZUC3fV
	zamB0k+OPuRI1A0vrKVLiOSdaY4gyCNpPR2Ci5LICoebcAdaHO8n03f0RdDRP1T6qcGiFvIt0Ue66
	fZrIyPAFiJkpXdUX9oqQxqnu4BiubrV8s3I90SdIjG3Hagi/QZEph0/hy8LjvUVD87sRHjhE+inaG
	Ln+zkz1KeTG7XkKYWGpVXTcVQabObssdNPty0BROQlsulIhpGzlL08+JdwyN5ukE5ymQa8chfB+9T
	SkM5+wkQZKPXwTaxuyRi/MxpQZrv1jFOBugDCUMkBSz0j7E2sYRIDy9LKicPRiSpDNzUphpr7AXun
	jcTWJRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZlYY-00000004qlP-3bhL;
	Mon, 20 Jan 2025 06:46:42 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZlYV-00000004qke-3ss1
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jan 2025 06:46:41 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-540218726d5so3878537e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jan 2025 22:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737355597; x=1737960397; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNXo4WaOxS///tBpR9StPLUAZBNZkjfmled10g42wXE=;
        b=YIbjdCfhZmG3fTvKHnDHFwV6Y7zITHtpNgrhgYZsYAwhb5D5Y/LBP9Ml7WbLICgQjo
         0ZtHtyouVaaH9rpsSbtfYYxKdqBKhrq1Z8HIS2zzLOjo6PUfCQIYHV3VaqKKyOe+AQ6S
         VSnonCi5+cg/3Wz3hqltbW5tXpdlgMNhifLro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737355597; x=1737960397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNXo4WaOxS///tBpR9StPLUAZBNZkjfmled10g42wXE=;
        b=lNfx6Ur0D0z+kNKlAV+6xVHjM2v9o4wdb/BuRzvyTo0cIyJ9ArZXf+nTN/0F5mUIGA
         8rtEfHPQ/ytHyjqDg8KemiGbqqWPyhDIVSBcPieOFt+RE+5oBYl6cfNRF7QoFYzARpwf
         T1+XYLvZE/WEmTSzTh4qXsElH286tFhcoO6zrq9cli9aXxsg21eMeSlEn0cH/+R524pp
         y1P3dsU+wNnGcJBsh6ezgC0XFVIGDFzNCsdfqYrqMcjVwavucpmWblWHgb8OOpxiqubU
         QFxuj3HkiW7oDb/5S9RLKURtMRU5d0fMhYicyr3J4oBiknh/l4Pt96qMVE3YpbAglrok
         hRKw==
X-Forwarded-Encrypted: i=1; AJvYcCWWkV/CE77NEUY2oe9AnUr0V8/gatEMpGSAazfh0rz7Vuyel5st+IS8GyTu045NGOCkbLyTZWV6fRZU2ogVkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZi7He1/pHW59gXLsI3A8drYTByQ1V2ETfJ2vYl4T30sQkAYoo
	wIru1pvzfrbq4U5NAmBMWnHl1I3aK+EBU5pv6ZUNbUczO33BPF8hc8GN2pM7X/jdqrPwwHEXSl0
	ri46iLt4vRckmctmY19x2t/4As971m57EGUSz
X-Gm-Gg: ASbGncvpcU87M7C/TT8or2r83P80k1q1b/E9a/qiNpAh/AI53Eiafzw4n1UYWhtlB46
	xdSZmz3njqpyR+RIA9OjqyHDMkn1LAXh7BIZrgwpkKY5ao26yO05+5usFC45Q8vykgHNhr4gCWs
	08Jw4=
X-Google-Smtp-Source: AGHT+IGe4S6TYf+4ulYMixEZAJCcy5WdGlwRlwQfzdR0+wuoegjONvE0lGUgeRF49B9dTczKUXEO+792vM5swITbus4=
X-Received: by 2002:a05:6512:b23:b0:53e:fa8b:822e with SMTP id
 2adb3069b0e04-5439c28258dmr3579236e87.37.1737355597391; Sun, 19 Jan 2025
 22:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
 <20241219170800.2957-2-jason-jh.lin@mediatek.com> <CABb+yY2t7rBnoBEf3Pog0eRW_zvb0YggbgKBspnZOS1bsyQBPQ@mail.gmail.com>
In-Reply-To: <CABb+yY2t7rBnoBEf3Pog0eRW_zvb0YggbgKBspnZOS1bsyQBPQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jan 2025 14:46:26 +0800
X-Gm-Features: AbW1kvYbC_aCNW0ewDsvXV7P02TnnXE-2bnIKZ2gq8f_DneY-FzYQmVy3vGEru8
Message-ID: <CAGXv+5Eg_5CFiCYPk29wvjPq03wO9js5nQNhF8A_kB9+K452uw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
To: Jassi Brar <jassisinghbrar@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_224640_139036_44847534 
X-CRM114-Status: GOOD (  33.59  )
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

On Sun, Jan 19, 2025 at 5:24=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Thu, Dec 19, 2024 at 11:08=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@media=
tek.com> wrote:
> >
> > 1. Add compatible name and iommus property to mediatek,gce-mailbox.yaml
> >    for MT8196.
> >
> >    - The compatible name "mediatek,mt8196-gce-mailbox" is added to
> >      ensure that the device tree can correctly identify and configure
> >      the GCE mailbox for the MT8196 SoC.
> >
> >    - The iommus property is added to specify the IOMMU configuration
> >      for the GCE mailbox, ensuring proper memory management and access
> >      control.
> >
> > 2. Add the Global Command Engine (GCE) binding header to define the
> >    abstrct symbol binding to the GCE hardware settings of GCE Thread
> >    Priority, GCE Subsys ID and GCE Event for MT8196.
> >
> >    - GCE Thread Priority: Defined to configure the priority level for
> >      each GCE hardware thread. This is necessary for proper scheduling
> >      and execution of commands in the GCE.
> >
> >    - GCE Subsys ID: Defined to specify the subsystem ID for GCE clients=
.
> >      This is used to correctly address and access different subsystems
> >      within the GCE.
> >
> >    - GCE Event: Defined to specify the events that the GCE can handle.
> >      These events are used by the driver to synchronize and manage
> >      hardware operations.
> >
> >    Examples of the binding usage in the driver code:
> >    1) GCE Thread Priority:
> >    - Defined in the header file: `#define CMDQ_THR_PRIO_4 4`
> >    - Used in the Device Tree: `mboxes =3D <&gce0 0 CMDQ_THR_PRIO_4>;`
> >    - Parsed and used in the driver to set thread priority:
> >      ```c
> >      static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,i
> >                                          const struct of_phandle_args *=
sp)
> >      {
> >         thread->priority =3D sp->args[1];
> >      }
> >      // set GCE thread priority to the priority level 4 for GCE thread =
0
> >      writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
> >      ```
> >
> >    2) GCE Subsys ID:
> >    - Defined in the header file: `#define SUBSYS_1c00XXXX 3`
> >    - Used in the Device Tree:
> >         `mediatek,gce-client-reg =3D <&gce SUBSYS_1c00XXXX 0x0000 0x100=
0>;`
> >    - Parsed and used in the driver to configure subsys ID:
> >      ```c
> >      int cmdq_dev_get_client_reg(struct device *dev,
> >                                  struct cmdq_client_reg *client_reg,
> >                                  int idx)
> >      {
> >         client_reg->subsys =3D (u8)spec.args[0];
> >         client_reg->offset =3D (u16)spec.args[1];
> >      }
> >      // GCE write the value to the register 0x1c000000 + 0x0000 + offse=
t
> >      cmdq_pkt_write(cmdq_handle, client_reg->subsys,
> >                     client_reg->offset + offset, value);
> >      ```
> >
> >    3) GCE Event:
> >    - Defined in the header file:
> >         `#define CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0 574`
> >    - Used in the Device Tree:
> >         `mediatek,gce-events =3D <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>;`
> >    - Parsed and used in the driver to handle events:
> >      ```c
> >      int mtk_crtc_create(struct drm_device *drm_dev,
> >                          const unsigned int *path,
> >                          unsigned int path_len, int priv_data_index,
> >                          const struct mtk_drm_route *conn_routes,
> >                          unsigned int num_conn_routes)
> >      {
> >         of_property_read_u32_index(priv->mutex_node,
> >                                    "mediatek,gce-events", i,
> >                                    &mtk_crtc->cmdq_event);
> >      }
> >      // GCE clear the STREAM_DONE event sent from DISP_MUTEX hardware
> >      cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> >      ```
> >
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >  .../mailbox/mediatek,gce-mailbox.yaml         |    4 +
> >  .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1415 +++++++++++++++++
> >  2 files changed, 1419 insertions(+)
> >  create mode 100644 include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mai=
lbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.=
yaml
> > index cef9d7601398..73d6db34d64a 100644
> > --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> > +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> > @@ -25,6 +25,7 @@ properties:
> >            - mediatek,mt8188-gce
> >            - mediatek,mt8192-gce
> >            - mediatek,mt8195-gce
> > +          - mediatek,mt8196-gce
> >        - items:
> >            - const: mediatek,mt6795-gce
> >            - const: mediatek,mt8173-gce
> > @@ -49,6 +50,9 @@ properties:
> >      items:
> >        - const: gce
> >
> > +  iommus:
> > +    maxItems: 1
> > +
> >  required:
> >    - compatible
> >    - "#mbox-cells"
> > diff --git a/include/dt-bindings/mailbox/mediatek,mt8196-gce.h b/includ=
e/dt-bindings/mailbox/mediatek,mt8196-gce.h
> > new file mode 100644
> > index 000000000000..9e0700236033
> > --- /dev/null
> > +++ b/include/dt-bindings/mailbox/mediatek,mt8196-gce.h
> > @@ -0,0 +1,1415 @@
>
> 1415 ?  90% seem unnecessary.
>
> > +
> > +/* GCE thread priority */
> > +#define CMDQ_THR_PRIO_LOWEST   0
> > +#define CMDQ_THR_PRIO_1                1
> > +#define CMDQ_THR_PRIO_2                2
> > +#define CMDQ_THR_PRIO_3                3
> > +#define CMDQ_THR_PRIO_4                4
> > +#define CMDQ_THR_PRIO_5                5
> > +#define CMDQ_THR_PRIO_6                6
> > +#define CMDQ_THR_PRIO_HIGHEST  7
> >
>  Only need to HIGHEST maybe

Or maybe we could just get rid of them and describe the valid values
and ordering in the YAML part?

> > +
> > +/* GCE subsys table */
> > +#define SUBSYS_1300XXXX                0
> > +#define SUBSYS_1400XXXX                1
> > +#define SUBSYS_1401XXXX                2
> > +#define SUBSYS_1402XXXX                3
> > +#define SUBSYS_1502XXXX                4
> > +#define SUBSYS_1880XXXX                5
> > +#define SUBSYS_1881XXXX                6
> > +#define SUBSYS_1882XXXX                7
> > +#define SUBSYS_1883XXXX                8
> > +#define SUBSYS_1884XXXX                9
> > +#define SUBSYS_1000XXXX                10
> > +#define SUBSYS_1001XXXX                11
> > +#define SUBSYS_1002XXXX                12
> > +#define SUBSYS_1003XXXX                13
> > +#define SUBSYS_1004XXXX                14
> > +#define SUBSYS_1005XXXX                15
> > +#define SUBSYS_1020XXXX                16
> > +#define SUBSYS_1028XXXX                17
> > +#define SUBSYS_1700XXXX                18
> > +#define SUBSYS_1701XXXX                19
> > +#define SUBSYS_1702XXXX                20
> > +#define SUBSYS_1703XXXX                21
> > +#define SUBSYS_1800XXXX                22
> > +#define SUBSYS_1801XXXX                23
> > +#define SUBSYS_1802XXXX                24
> > +#define SUBSYS_1804XXXX                25
> > +#define SUBSYS_1805XXXX                26
> > +#define SUBSYS_1808XXXX                27
> > +#define SUBSYS_180aXXXX                28
> > +#define SUBSYS_180bXXXX                29
> > +#define SUBSYS_NO_SUPPORT      99
> > +
> Keep only that you use now or plan in  the near future. But ok.
>
> > +/* GCE-D hardware events */
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF0                                  =
         0
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF1                                  =
         1
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF2                                  =
         2
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF3                                  =
         3
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF4                                  =
         4
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF5                                  =
         5
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF6                                  =
         6
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF7                                  =
         7
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF8                                  =
         8
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF9                                  =
         9
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF10                                 =
         10
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF11                                 =
         11
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF12                                 =
         12
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF13                                 =
         13
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF14                                 =
         14
> > +#define CMDQ_EVENT_DISP0_STREAM_SOF15                                 =
         15
> >
>  you mean
>   #define CMDQ_EVENT_DISP0_STREAM_SOF(n)  n
>
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL0                              =
         16
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL1                              =
         17
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL2                              =
         18
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL3                              =
         19
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL4                              =
         20
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL5                              =
         21
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL6                              =
         22
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL7                              =
         23
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL8                              =
         24
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL9                              =
         25
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL10                             =
         26
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL11                             =
         27
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL12                             =
         28
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL13                             =
         29
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL14                             =
         30
> > +#define CMDQ_EVENT_DISP0_FRAME_DONE_SEL15                             =
         31
>
>    #define CMDQ_EVENT_DISP0_FRAME_DONE_SEL(n)
>             (16 + n)
>
> > +#define CMDQ_EVENT_DISP0_DISP_WDMA0_TARGET_LINE_END_ENG_EVENT         =
         32
> > +#define CMDQ_EVENT_DISP0_DISP_WDMA0_SW_RST_DONE_ENG_EVENT             =
         33
> > +#define CMDQ_EVENT_DISP0_DISP_POSTMASK1_RST_DONE_ENG_EVENT            =
         34
> > +#define CMDQ_EVENT_DISP0_DISP_POSTMASK0_RST_DONE_ENG_EVENT            =
         35
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_TIMEOUT_ENG_EVENT                =
         36
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT0            =
         37
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT1            =
         38
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT2            =
         39
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT3            =
         40
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT4            =
         41
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT5            =
         42
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT6            =
         43
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT7            =
         44
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT8            =
         45
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT9            =
         46
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT10           =
         47
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT11           =
         48
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT12           =
         49
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT13           =
         50
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT14           =
         51
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_REG_UPDATE_ENG_EVENT15           =
         52
> > +#define CMDQ_EVENT_DISP0_DISP_MUTEX0_GET_RELEASE_ENG_EVENT            =
         53
> > +#define CMDQ_EVENT_DISP0_DISP_MDP_RDMA0_SW_RST_DONE_ENG_EVENT         =
         54
> > +
>  keep only the used ones and use

This is the only publicly available table of the numbers. Having
the complete table somewhere would be nice. OOTH the numbers being
like IRQ or DRQ numbers, don't actually get used in the driver.
So maybe we could keep the full list but move it under the dts directory?


ChenYu

