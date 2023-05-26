Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C02DC77B73
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 16:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVB1oaEqb0nCh7/TkolrkD30I0YxpmZoZt03ZQMqTUU=; b=u9BJ/iV1KeJORgeHVONCGLpQeJ
	GoJuAV+U6OuxjGEfvUjBTB1k/79MlVtGXXOp0CKKmyEoAeUKFglgCBDjPB197CGm0ZpKctc/+C9Xk
	tg03mW4JUFcrQyWjvzZh8EX6Q0nsP7wT4S0hE62V5VrHyXroUDmLDiPU/QBO++osbUzTkL6A+n0z1
	acq3RoByrDr5qMURrO9tepsIwOHl/ZzaC2ItRyp9OE5IMM5YexZBjPCMoHWqKLCZDlp/z3Bhh3yfZ
	VIlSHrq8dphOJiUGig4p9dMZcjirD140Zn3UOM8K/UBBA55z+nznj+23GZlPfkxZv08yTZFPzhp6D
	o9mkxcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ajP-003Bxo-0A;
	Fri, 26 May 2023 16:55:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ajL-003BvN-1X;
	Fri, 26 May 2023 16:55:56 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-514859f3ffbso319533a12.1;
        Fri, 26 May 2023 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685120152; x=1687712152;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BVB1oaEqb0nCh7/TkolrkD30I0YxpmZoZt03ZQMqTUU=;
        b=HOONLSKAnH/QqPHu9WT2rWuKt7J+3VuaOtzRIn0ktdQRHt+mj3noIyD8rvM4NEKBQl
         WMe/8Ik+L397mXmmOetDYl3Dk6BdBBRGfQj8TeFbdpfv9m+iui0umv+J07nt1IKaF0YC
         B2AE8wTu7VvhuGrjCwwO52nHkz2NnGL78TWkuOA/znZ4IS/Ze8GjhmoyAIQm390K7gM3
         LxpsB7Yzn+4pxiuKskquw40slwV2sRrES7up5wDCg/fh3PhlTBScEDFRlurN2sK+XtDf
         kK2t4TawNMnAcGtv3LET3DG3PC0gmzxbAYb3el0EQMjjwd8kpJ2JCXTl2YnPlS702HEi
         XfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685120152; x=1687712152;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVB1oaEqb0nCh7/TkolrkD30I0YxpmZoZt03ZQMqTUU=;
        b=QzLLIV8zM/Xc8aLYHKJ8QMmzaJBYKNJE/o+tr2zpuK9st4ttHkQRfaGh7qFje/j2TW
         q8zTda4adTbqnQS3pzLEB6FkRtWOEjJGvyf0BM/WPoX+ExDNw2YRCUo1Hcwrqk5wZ/+t
         wBwzewFwD01ww2p+6J32i/DjendD/g6gzOGIOUYPABVWy+Dk5/eQkUiAKUbwphRjNPxc
         zqbeb9jeUe4b76mXy/KQAjdO2fG/WDTYkXSE5mky35K5rBtJxBjzLU8l5XwLdyOTylQT
         W99jIGEB8PTNykw+ILGp6wcT4XXSydAvqqFD1vUH6z2TW56w8Oh9lKNGn4QQuMg4cpRZ
         Bjzg==
X-Gm-Message-State: AC+VfDy7Rv3xayatJBDn11eJf18P1UZweIXCcGbzBL92xVkCVi0Popqx
	tLQSmy5lPiopZijC5xG1ERU=
X-Google-Smtp-Source: ACHHUZ4iTjI8KlCBHfyi32LLUWk745b3RNHS4iOVUUpprzoTVHgO/Ljbxr5EdgBITrwa1iNNyX9WyQ==
X-Received: by 2002:a50:fb17:0:b0:514:7a67:44dc with SMTP id d23-20020a50fb17000000b005147a6744dcmr1516263edq.19.1685120151838;
        Fri, 26 May 2023 09:55:51 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id w17-20020a056402071100b0050c03520f68sm127797edx.71.2023.05.26.09.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 09:55:51 -0700 (PDT)
Date: Fri, 26 May 2023 19:55:48 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 26/30] net: dsa: mt7530: properly set
 MT7530_CPU_PORT
Message-ID: <20230526165548.d6ewov743orxviz3@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-27-arinc.unal@arinc9.com>
 <20230522121532.86610-27-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-27-arinc.unal@arinc9.com>
 <20230522121532.86610-27-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_095555_514843_A9E1D434 
X-CRM114-Status: GOOD (  24.28  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:28PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The MT7530_CPU_PORT bits represent the CPU port to trap frames to for the
> MT7530 switch. There are two issues with the current way of setting these
> bits. ID_MT7530 which is for the standalone MT7530 switch is not included.

It's best to say in the commit title what the change does, rather than
the equivalent of "here, this way is proper!". Commit titles should be
uniquely identifiable, and "properly set MT7530_CPU_PORT" doesn't say a
lot about how proper it is. It's enough to imagine a future person
finding something else that's perfectible and writing another "net: dsa:
mt7530: properly set MT7530_CPU_PORT" commit. Try to be less definitive
and at the same time more specific.

If there are 2 issues, there should be 2 changes with individual titles
which each describes what was wrong and how that was changed.

> When multiple CPU ports are being used, the trapped frames won't be
> received when the DSA conduit interface, which the frames are supposed to
> be trapped to, is down because it's not affine to any user port. This
> requires the DSA conduit interface to be manually set up for the trapped
> frames to be received.
> 
> Address these issues by implementing ds->ops->master_state_change() on this
> subdriver and setting the MT7530_CPU_PORT bits there. Introduce the
> active_cpu_ports field to store the information of active CPU ports.
> Correct the macros, MT7530_CPU_PORT is bits 4 through 6 of the register.
> 
> Any frames set for trapping to CPU port will be trapped to the numerically
> smallest CPU port which is affine to the DSA conduit interface that is set
> up. To make the understatement obvious, the frames won't necessarily be
> trapped to the CPU port the user port, which these frames are received
> from, is affine to. This operation is only there to make sure the trapped
> frames always reach the CPU.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Co-developed-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

A single Suggested-by: is fine. As a rule of thumb, I would use Co-developed-by
when I'm working with a patch formally pre-formatted or committed by somebody else,
that I've changed in a significant manner. Since all I did was to comment with
a suggestion of how to handle this, and with a code snippet written in the email
client to a patch of yours, I don't believe that's necessary here.

> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

