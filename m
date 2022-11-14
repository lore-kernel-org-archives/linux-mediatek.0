Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9560BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 06:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS5CjFgX03A69nfrKfxJXZ5fpQt8/TU8VVKE0FbaEp0=; b=mjLVaQI2ab9e4ppyEg2BjDm9oV
	28INBmR8APrYI/8wQeVtC9GsbERRoHxleWOLJehg8/ikjrAfnbLmn+ttAIcsAyq/JkLcjhlPP58+3
	FMqj1h+K8f3et2z2jeYbHfRqi1phNrJ7xG/XjeF4OAGYCmgytdVQcLUgOjBXjhwScHADBvBUjBiVL
	q0RESdPtNc1jWBIg/m3PBbLXAALb+hGyHIiO2NLWnrfQP0V8st4i2UWQcbb6BtfQOlg3AKq/R1UU/
	gnQQcRhpWi+BhO3wG6kv2WWslwtzYyjcxIpumMurKX9YzhwNTJu+vbnSM0ujNzyHWq3vS0mWOtQLc
	959xvdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouSiU-00GD1h-IJ; Mon, 14 Nov 2022 06:13:10 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouSiJ-00GCy8-C4
	for linux-mediatek@lists.infradead.org; Mon, 14 Nov 2022 06:13:00 +0000
Received: by mail-vs1-xe30.google.com with SMTP id m4so3627689vsc.6
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Nov 2022 22:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GS5CjFgX03A69nfrKfxJXZ5fpQt8/TU8VVKE0FbaEp0=;
        b=W/2t4o/NOu/LOfgvVdB0xbock6syO+D+eGmXWOZRTkC6WD7SQqZ5PnS7URvq7ATXN9
         pqIlFlVqLbDE/hnEJI0oWYOrp+951c5THEaarKPZbgYHq2MtjnLgpzUxjd8ny4YiHbk/
         SiLDG8ildHQxdX6D8gqg9lEFGh2ZffmRV0g7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GS5CjFgX03A69nfrKfxJXZ5fpQt8/TU8VVKE0FbaEp0=;
        b=0Alx16qG4PM2lr77/dJF5fggp1edXcK/sgoPNGLE8tYoKvRcaq4ahA8WroUQeDjk0x
         oMOM7YB0v5HCCz/dLEOwYdEBW5ihME2yYFROjbwe8+JW2KXg40QVbE9biUzGaJlXmyuG
         mqRzNzqywUa4b6tSPX1x37DpocM7Gb27mEphLKlot0AqbQq6eTgkAMkqC7v7uy9MAJBl
         yQHIFIBgSapuVbDvtWeQqf836t+J/EwnRt4RWnf+qe0I9yD6GAX22u0c4m/bCq55ni1z
         uWaKG+/Sb5UF54lOzSEd/Wnz9mJ+cb7ezcXx6TBtdAt0iZl2uswdcgFSikCNLi4GPgv7
         mlkA==
X-Gm-Message-State: ANoB5pmgxaClLAc5kv8NeIAoiNjAXJF1nVP6QfmkxJl3zxaPc13GkFrL
	rmS0YboUeddlH80kVIa5IhJuQTBSszhDTPoLRRL83Q==
X-Google-Smtp-Source: AA0mqf41+D+Ta4oBw16Qp6PCDMGuKp6Gp9xsPVuyCFaDRWusJIXHR3jVRIru9gUnhrPd8Dy0Hma+yhUJEJjo6Xvq5cw=
X-Received: by 2002:a67:fd97:0:b0:3aa:19e1:eb2a with SMTP id
 k23-20020a67fd97000000b003aa19e1eb2amr5372752vsq.26.1668406376822; Sun, 13
 Nov 2022 22:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20221018114122.26785-1-yunfei.dong@mediatek.com>
In-Reply-To: <20221018114122.26785-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Nov 2022 14:12:45 +0800
Message-ID: <CAGXv+5GsE1s3gYSt7u=sMZR=FhnpDfxq_XhxUTUrKw+EM423PA@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: fix h264 cavlc bitstream fail
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	George Sun <george.sun@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_221259_418881_61A99860 
X-CRM114-Status: UNSURE (   9.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 18, 2022 at 7:41 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Some cavlc bistream will decode fail when the frame size is small than
> 20 bytes. Need to add pending data at the end of the bitstream.
>
> For the minimum size of mapped memory is 256 bytes(16x16), adding four bytes data
> won't lead to access unknown virtual memory.
>
> Fixes: 59fba9eed5a7 ("media: mediatek: vcodec: support stateless H.264 decoding for mt8192")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

