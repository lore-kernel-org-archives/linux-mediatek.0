Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6B4C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 04:09:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4499A613FB
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 04:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4499A613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgLpb/xAUvB24CUA7+DwvEOgUlv98CX2MTT0fvWOyWk=; b=ANItmneX3ZxMdw
	mMU75yoX8JM5bYtDlgyhIcGwP8GErqsiOX243kVxS3QeZKHu2E+r7QiH8FqIiSx2zaNo5D154dq4U
	Vo0tzxekunvbBksaxhnamIVy2Eqmfk7ZAjNX6JGBGPurbRW33DUyou1U+kTw+aL+ZMJRWcjgEUAZX
	mWmzc7oEjXDPRU0vMCPG5wSe2wx4V4Gkwow9l/+unx0MzE/6sRa7O5SoQX3rTvsK/7HUIT2EeycYR
	iXqASOEfaUqxn/+EwIEV+mx7VMvq30vASvkX7swSz7CdKIP+LN491vfPTFkKEWfgy3Pdh8NkOnH2y
	b+uRVupyvCEDzyC//G3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzAUN-0020y4-Bu; Fri, 02 Jul 2021 04:09:15 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzAUL-0020wx-8z
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 04:09:14 +0000
Received: by mail-il1-x12b.google.com with SMTP id s19so8586139ilj.1
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 21:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1gC6Cvl08bnslgy8WMJr7QNn+YYwFlDy13+HxzwRk8M=;
 b=NciZtOZ25evhYvZlsCKUK1olqhbASLK7QkPiPHy3BPnDfBvV6maHGibVQjs3Z4CDc+
 709TkprfM2FKC7TqPaO+aYrdwKZDiiJ5ClxrAXLYh7Msp1YpidnvopVGGYdUFymYM6H1
 sTnEQBKNMflYZ1VUcPcjzAmjhv6QoqZL8cTVw0ttSHHdoKuYJE9OVNlGaY84gKzOhzgg
 y+2ASjN+MsOpKHXicCrLjSYsimbuOxGM1HsfUXmcHbYL7MD+KN1zAnIz8ZekVK59YTJR
 6pN6UorVkUbHoxolVAFDBGivrpeGfQHuuKiNuZF6DM1v1EnONybezObTzRyquu4h2vlU
 fCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1gC6Cvl08bnslgy8WMJr7QNn+YYwFlDy13+HxzwRk8M=;
 b=KT61dI4h82OUgi0coOQtiW35fdGtyZ390yBhbl1lVnFddjC5Fdp31Y3dJgum0mPRuO
 GwNA6wJyODMNkSkspe6OOk06Q7oc18V3Kz2RJQJBsuDfKwXr3O8eQ8/uuknP09A7xgxY
 ulW07ORFKydnO0olyeMfFCBvxXz4wlRb977p2H1de9iRkav/Erze5eYRlDOulJlBCw4F
 ixBibskkWyNa/ENVgQlaZdeo7tSLXQNlMWXir10uzrhx4AHURQtIsg4snmrl71bitgaC
 HEGFrVzZs7KeNeJLBmaX0vZ4O3E3C9ZdZ4aXj7ggYNURVr9Hh9ySTulOPBkA8lmghRnO
 GBdA==
X-Gm-Message-State: AOAM531oNyAPo2sF9jRm7x3cnQM8czsTuBBSUgx4k6yWgMrEqjsQN5kD
 pCndytZv/JKhjym59rDS/kYvGusi41LyYW7t63UQbg==
X-Google-Smtp-Source: ABdhPJyMAYJ+oj3Ah4Z5Te9mpgidxlbMPme/PtZviWgLgSIfiUPgsYDOKP3BdaS2QUHV4m/FgKmZbeNg5jF0BLg85Zs=
X-Received: by 2002:a92:dd05:: with SMTP id n5mr1966777ilm.72.1625198950511;
 Thu, 01 Jul 2021 21:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210630085247.27554-1-irui.wang@mediatek.com>
 <20210630085247.27554-3-irui.wang@mediatek.com>
In-Reply-To: <20210630085247.27554-3-irui.wang@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 2 Jul 2021 12:08:59 +0800
Message-ID: <CA+Px+wUdPx39jQ2OPi_yTfmqAiPT=TB_vdQFpe+GVRfNm3R3pQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 VENC
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, 
 Yunfei Dong <Yunfei.Dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_210913_343870_B1CDABB2 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 30, 2021 at 4:54 PM Irui Wang <irui.wang@mediatek.com> wrote:
> Updates binding document for mt8192 encoder driver.
Typo in the commit message.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
