Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE6FC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tk3RaGDRfRVv0tlpJCdq6gLxpXZLUoxuYeWx+eXPzUo=; b=HytwTXUH46HMRaqTk05QpxOQMD
	DeRgx1zNJSKhxuscO0eZVxDKCqiDvF6ILzYvSichrpwuY0Cxm6YLEFgpItko9JANE5H+HEOjtN9+w
	qMhgpxsXadcW6gWBoDvq5ojo7WGcsh4X1VscO4yCY1lRk6H1ZNtl4PYZsTx8s9T90N2avm2TF1m45
	PG2UYrM/OcQAwfO6QbOh/yprI9utST+XWG8S+vGZikXHW+NPDGtPU4esQYs8kMZwFV4kiJypuXheS
	FyzWf8KdUOY+4zOX5zH81076/xouGD7GehtsMtqwTm/IUV0JDZdUzqOO9YyIvEYbbq8s154KbRwlz
	wAjwX4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNgOf-00HAXy-8w; Thu, 02 Feb 2023 20:41:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNgOc-00HAXS-V0
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 20:41:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id r8so3142779pls.2
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 12:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tk3RaGDRfRVv0tlpJCdq6gLxpXZLUoxuYeWx+eXPzUo=;
        b=MENKp873NXo9ALLlUOUDHg9jijpviObR/IUQ29GZLl1vem82P6QA8dis0ITSUgphAB
         16LhCFBhrXHxAtYdGSTdO7GY/AjEnTjEbSdymoI1Yfj0C2ZTNP/GfGF4RqEJVb/bTGB8
         PoFwztIJQLkrroZqHl8Aj27vPM4CPJ3iICg/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk3RaGDRfRVv0tlpJCdq6gLxpXZLUoxuYeWx+eXPzUo=;
        b=eCTRLa3ZDXH77WCNirefBKxXZ0gakl8CNueXzUHGc3dEXMuhLCS8soHoSVeKdxGsuc
         AbaBY2Q2taLlmgb6s0ezUjMOygHXoiINmpxxJFP6Lr9mJFO38nV30moKBk4n6L+8GMAV
         La1VbZDUu49R1X3zfwyaTMwq72+quhgRvG5tZ40tP2DEhpSzK2uZK7MOSIKk6PrIZ5M2
         Um5hl+GLy67p4AupEw1MgiEiQhG2s3tqFbgJD6pimtD2eqrwqWv4bRF3YroGCIXdjyfN
         0pIc4BPo4B7WsGUVWT74PtScsDytcktsI6n4yFOiN2ygrBdR/CVFR/S9sqRLKQc/hZPq
         M5vg==
X-Gm-Message-State: AO0yUKXR/gUdaC2eADhi+PViWTpnS0I1nUHkkBCPG9ZjkVA2eQf9cj2W
	ej/Q4CtWUvHrjf/iyPrURX68tlv0cM0OzeQtAUbxUA==
X-Google-Smtp-Source: AK7set+VBvRA+LsX4oN7Bw9qtjkPlQ7I5Hxc6/6dJQv4z010NW4PdMvc+7/j3zrP/NSzeXIY6tYisvZeVynKKDhRGkY=
X-Received: by 2002:a17:90a:540a:b0:22c:6223:d27a with SMTP id
 z10-20020a17090a540a00b0022c6223d27amr799859pjh.61.1675370485030; Thu, 02 Feb
 2023 12:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-2-greenjustin@chromium.org> <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
 <CAHC42Rf8+yS45VBUc_dDuvCydg4ttKYuGwdgFshZRUZWzGiXRQ@mail.gmail.com> <15711c23-43c4-86c4-0f56-4a76b5ffea46@gmail.com>
In-Reply-To: <15711c23-43c4-86c4-0f56-4a76b5ffea46@gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 2 Feb 2023 15:41:14 -0500
Message-ID: <CAHC42Rff5Xj_5bJNVozAYnG+ujjZ+R1DjDfWZn4GvsyQV+do_Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/mediatek: Refactor pixel format logic
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch, 
	daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_124127_035751_95A48C28 
X-CRM114-Status: GOOD (  10.19  )
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

> Yes, I had a comment on the naming in that patch. Never the less, I think if we
> don't need to "overwrite" the value, we should use just one struct for the
> values instead of copying them to the different .c files and give them SoC
> specific names.
I don't have a very strong opinion about this, and in fact that is how
v1 of the patch worked, but Chun-Kuang specifically suggested moving
that struct into the .c files a few versions back. I think it makes
sense if we expect additional skew between the different components
and what pixel formats they support.

