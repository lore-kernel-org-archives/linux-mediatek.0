Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E716C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzQULThSMa3V8Wn0KB+WgzTkFY9z7EEkKp9dzElr/SY=; b=36bUNrE1x+KObX
	34w4pmPqiFA2eORYPLSjYvwe6VPVeUdiQv+0M3ptx6O5HLv1tYfoqp/aSxKzGBIiY/LgWzy2o9IWN
	Fu0mtkOdu7MV4yHz0/7gOpHM7gAB7hZaqT8ZEJH5Y1Tkb4vZbajxL9GA02NIyLUk290BXuxIu0WZk
	Mtei2XvwzNnzJg9UGI7GMdbxt0HjJvnPlfGkRqGE5mrtf+t33U4JjNxC/FPmsStodIZRPt9ScHcTj
	L3qVwqWWvmWgdc/7fC+7uzQgVeijwVbq5gpP2NVgjU+GWAOgnGB8XQUZiJecEdVyfFenhX+9sTJ0U
	5Hn0CElD7p3zf7SgbI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPYu1-004pbU-FS; Thu, 03 Mar 2022 00:01:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPYtm-004pXn-5v; Thu, 03 Mar 2022 00:00:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8C953CE16A1;
 Thu,  3 Mar 2022 00:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1159C340F2;
 Thu,  3 Mar 2022 00:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646265647;
 bh=Gh+Iw395lx9OcmDBaop4139TbIG8zRBjlYsZzNBFWco=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BocpuqTmutORsZYOiNSdm6lbdqku4oUyiaGBbawYajhypmeyVq/AFKrfpskEbcDf1
 Q4/3uRPtQVWQFi13n7scGMH2Wid9LMjelDkVKUG+YEX7DHDQZ0KWBXrrawYLftXc3k
 imwIMLlwqpUJdpgJFKoH1Z3B51kHkMs0QNYnA8bhbSTXwnhU0Cu1B3wklft1sYv1Q5
 sZrEciaPDY3ZaKJyqH1bwFDtdS/e3oeCQj2G8VxNKQ5Z3e8195bISM1iV0JOy11v3j
 OMssM1DtJK+tk/y6B7eunZOi4e+gNL/pU1dRgivstJDAtlfMwXfKDmZjslIiDbLCgP
 ZdiHHAR5HAnQQ==
Received: by mail-ed1-f45.google.com with SMTP id g20so4445778edw.6;
 Wed, 02 Mar 2022 16:00:46 -0800 (PST)
X-Gm-Message-State: AOAM530KC/3XCpUHqvkp0RO1hdqq5YcyaZXNvAyw7glddtIKEUKW0/Sx
 pnyzOoq6KXTe1n04z9vWeq4WUL4huM9PIHu5/A==
X-Google-Smtp-Source: ABdhPJyCWS2G7IAO37h6jGUTcYx1AHcHdPNzIqNZZelMR25IBMLn05AR7M7SJt01irflojL+S4EdT9nvnMtxT4pRjgc=
X-Received: by 2002:aa7:df12:0:b0:410:a50b:de00 with SMTP id
 c18-20020aa7df12000000b00410a50bde00mr31738511edy.2.1646265645243; Wed, 02
 Mar 2022 16:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <20220126071932.32615-4-jason-jh.lin@mediatek.com>
 <CAAOTY__K_0sp6+VdL0yi=wF9wA_uag4HKqK3ST7uySdkzfCHBA@mail.gmail.com>
 <CAAOTY__Xz0Pu30tmUrNJ=Nji=03Xv_3Qw526_hT-zELME36Bxw@mail.gmail.com>
In-Reply-To: <CAAOTY__Xz0Pu30tmUrNJ=Nji=03Xv_3Qw526_hT-zELME36Bxw@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 2 Mar 2022 18:00:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLU0m9C1OPdiBPTkofB4sfiAeUPbFHp0w8caWyP4XPOEw@mail.gmail.com>
Message-ID: <CAL_JsqLU0m9C1OPdiBPTkofB4sfiAeUPbFHp0w8caWyP4XPOEw@mail.gmail.com>
Subject: Re: [PATCH v15 03/12] dt-bindings: display: mediatek: disp: split
 each block to individual yaml
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_160050_588023_39C12772 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 7, 2022 at 5:07 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> OK, it seems no one has comment on this patch, so

No comment because the patch was not in PW. That's most likely due to this:

Subject: [PATCH v15 03/12] dt-bindings: display: mediatek: disp: split
each block to individual yaml
Date: Wed, 26 Jan 2022 15:19:23 +0800 [thread overview]
Message-ID: <20220126071932.32615-4-jason-jh.lin@mediatek.com> (raw)
In-Reply-To: <20220126071932.32615-1-jason-jh.lin@mediatek.com>

[-- Warning: decoded text below may be mangled, UTF-8 assumed --]
[-- Attachment #1: Type: text/plain; charset="y", Size: 50916 bytes --]

"y" is not a valid charset. This is caused when git-send-email asks
for the encoding and you answer 'y' rather than <enter>.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
