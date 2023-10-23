Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA53ACDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClzLCPEn1/RDjIo1E6Nnql8+vBKZIk7KnsLu7dKI+DE=; b=lDCLRrhXYS9KTCKAa7jD9MVypB
	UjiQdDxpjUDkx7QMla3qd3Wj7XFvMTwdwixcPNzTRdiIHPKSboZgJxpNlnG9hA9oFOmrB/iVIZnCD
	ZE5s5+v0MCj6El2GSfgtlmqwh0+F7Kuu9iaKvSiuR3kN5PElM6fpoNSoyKCahg0Dqv75fnfS+TX+Z
	NhNdgi8Ti9Ju/eOZCRnx4jR89TAuuHnNsbFLbw05zf+ZSBKYsC193/0OLxh5tt4dAnE3gYlLBztUI
	haSmr+ww1eNSn4j+8s/Ic54z6pxnBCwLw+9rhNPjhUj9sd3iMiAQeA7rKYwM4eYYRVwxYHcrzacNd
	tPYI5yjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqNs-006mHa-1r;
	Mon, 23 Oct 2023 08:34:00 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqNq-006mGz-0I
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 08:33:59 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-66d122e0c85so20093776d6.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698050036; x=1698654836; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClzLCPEn1/RDjIo1E6Nnql8+vBKZIk7KnsLu7dKI+DE=;
        b=mLHIu6VFNVXWq+sO4b0f5OLBu1eN6ujMJ+EjhNisFd+7P5BJEqioZV4v9LSvQiUnTI
         7j0O+iC9v5VBqP+EzC+wVt3Jbf8hu99HqX+1A0M0qcpZhoLNfPmjjGx4VxWgMqvXIPSh
         nQ7t2XOTWCMjRdspC7RhuLS2dpepHlFwP/4WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698050036; x=1698654836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClzLCPEn1/RDjIo1E6Nnql8+vBKZIk7KnsLu7dKI+DE=;
        b=Kjc0JcPthEKXYReuGeTTTZKx3OGCfvI/4i86Jj0LeQNh5YZadkctuCcBBjD976l4mu
         AJJ3bvEzb3/+u4d3jypXf0QGGxbibTPXBsRfsdTvi7WM4bimb0DBRoZyuJTPZe36/teV
         Dj0veKBOkEOoYXaSMswdvDzjs0LkG0MqOEQbA1wEoskmZdM9aZVZm9FPT0tSV9Abresj
         q3Y5j+cKXwMBgT40CSNpUCKTMOiWlLHrEwfZuauugNA1W4ZkQMHgnHl18hOdd1pX9t5R
         41FuazIJ1fekO/WIeK0OyuYA9cXPDXdWYM+XZyCGps+Q8bCHY8znYwdsWiL85OLu/UvP
         tDUw==
X-Gm-Message-State: AOJu0Yybm/acAvIHn+U2PmZxaXGXzVNgzkfNyl1JDPuxYrY7ZgxhMiuB
	V4N7jRv14/V3QvuCgydXjLbT1r0PWIbANaKwOtc=
X-Google-Smtp-Source: AGHT+IGMMUD8aZNd3tHu2odMQkgTqAlT3Xrk7XPEpV09eS3caOd4SbW68Oij5f06lNCdNgMeJwiPew==
X-Received: by 2002:a05:6214:486:b0:66d:33e1:e480 with SMTP id pt6-20020a056214048600b0066d33e1e480mr11698492qvb.59.1698050035596;
        Mon, 23 Oct 2023 01:33:55 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id l19-20020a056214029300b0065afe8f149asm2670648qvv.69.2023.10.23.01.33.55
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 01:33:55 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-778a20df8c3so218831285a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 01:33:55 -0700 (PDT)
X-Received: by 2002:a67:ac4c:0:b0:457:cd5d:6ab5 with SMTP id
 n12-20020a67ac4c000000b00457cd5d6ab5mr8578255vsh.23.1698049615911; Mon, 23
 Oct 2023 01:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com> <20231023043751.17114-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20231023043751.17114-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 23 Oct 2023 16:26:19 +0800
X-Gmail-Original-Message-ID: <CAC=S1njjd+-oEgmBeWJGQC0PsbOdJ5eLLw0Mf35HOjA8UHStTw@mail.gmail.com>
Message-ID: <CAC=S1njjd+-oEgmBeWJGQC0PsbOdJ5eLLw0Mf35HOjA8UHStTw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] soc: mailbox: Add cmdq_pkt_logic_command to
 support math operation
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Jeffrey Kardatzke <jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, 
	Johnson Wang <johnson.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013358_170982_B9557AF6 
X-CRM114-Status: GOOD (  19.94  )
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

Hi Jason,

On Mon, Oct 23, 2023 at 12:39=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> Add cmdq_pkt_logic_command to support match operation.
s/match/math/

>
> cmdq_pkt_logic_command can append logic command to the CMDQ packet,
> ask GCE to execute a arithematic calculate instruction,
s/arithematic/arithmetic/

> such as add, subtract, multiply, AND, OR and NOT, etc.
>
> Note that all instructions just accept unsigned calculate.
s/calculate/calculation/

Or I'd rephrase it as:
  Note that all arithmetic instructions are unsigned calculations.

> If there are any overflows, GCE will sent the invalid IRQ to notify
> CMDQ driver.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 36 ++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-cmdq.h  | 41 ++++++++++++++++++++++++++
>  2 files changed, 77 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediate=
k/mtk-cmdq-helper.c
> index b0cd071c4719..5194d66dfc0a 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -13,9 +13,18 @@
>  #define CMDQ_WRITE_ENABLE_MASK BIT(0)
>  #define CMDQ_POLL_ENABLE_MASK  BIT(0)
>  #define CMDQ_EOC_IRQ_EN                BIT(0)
> +#define CMDQ_IMMEDIATE_VALUE   0
>  #define CMDQ_REG_TYPE          1
>  #define CMDQ_JUMP_RELATIVE     1
>
> +#define CMDQ_OPERAND_GET_IDX_VALUE(operand) \
> +       ({ \
> +               struct cmdq_operand *op =3D operand; \
> +               op->reg ? op->idx : op->value; \
> +       })
`((operand)->reg ? (operand)->idx : (operand)->value)` fits in one line.

> +#define CMDQ_OPERAND_TYPE(operand) \
> +       ((operand)->reg ? CMDQ_REG_TYPE : CMDQ_IMMEDIATE_VALUE)
> +
>  struct cmdq_instruction {
>         union {
>                 u32 value;
> @@ -380,6 +389,33 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subs=
ys,
>  }
>  EXPORT_SYMBOL(cmdq_pkt_poll_mask);
>
> +int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, enum CMDQ_LOGIC_ENUM s_=
op,
> +                          u16 result_reg_idx,
> +                          struct cmdq_operand *left_operand,
> +                          struct cmdq_operand *right_operand)
> +{
> +       struct cmdq_instruction inst =3D { {0} };
> +       u32 left_idx_value;
> +       u32 right_idx_value;
> +
> +       if (!left_operand || !right_operand)
> +               return -EINVAL;
> +
> +       left_idx_value =3D CMDQ_OPERAND_GET_IDX_VALUE(left_operand);
> +       right_idx_value =3D CMDQ_OPERAND_GET_IDX_VALUE(right_operand);
> +       inst.op =3D CMDQ_CODE_LOGIC;
> +       inst.dst_t =3D CMDQ_REG_TYPE;
> +       inst.src_t =3D CMDQ_OPERAND_TYPE(left_operand);
> +       inst.arg_c_t =3D CMDQ_OPERAND_TYPE(right_operand);
> +       inst.sop =3D s_op;
> +       inst.arg_c =3D right_idx_value;
> +       inst.src_reg =3D left_idx_value;
> +       inst.reg_dst =3D result_reg_idx;
> +
> +       return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_logic_command);
> +
>  int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
>  {
>         struct cmdq_instruction inst =3D {};
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/me=
diatek/mtk-cmdq.h
> index a253c001c861..ea4fadfb5443 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -26,6 +26,30 @@
>
>  struct cmdq_pkt;
>
> +enum CMDQ_LOGIC_ENUM {
Use lower case, and perhaps use `cmdq_logic_type` or `cmdq_operator_type`.

Regards,
Fei

