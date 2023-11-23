Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A2EC61D97
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKRgb2z78RZx09YsB4iQfRlxkBipqBscSGNjxPS+MLA=; b=hBczl6p5htO/do
	FhO8r/MLVzQH/eJcErQp68rx9aslRYaQugj8j/h9CYtvlboDeUw57/b9MGL2RD5VgEnKZOiXhEnWw
	IXyBm8R+7gd+MJ3b8dvp+Xnbw0odDWEZ17s0qOinshwmQGPq6j8rb8smyTUd9VsUrnOC6Wusqh5hM
	XQzy2acQ0IvNWxn2S9DGubkBWmf1sPIaStDVo+UN1HA1mL0anFDnwGeet+Bf4LPJOQ25adZcrgOlA
	fE3w9O23tvQ6p/d68MUByhB6/4nUCG4iEZTK2nea+oKqkVsPcda0iEowHmlr8TIxr/dxXN1FQRiUk
	V0voajhwnLsZHGrSryQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Bm2-005BnS-0I;
	Thu, 23 Nov 2023 15:37:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Bly-005BmQ-04;
	Thu, 23 Nov 2023 15:37:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 913ABCE2A89;
	Thu, 23 Nov 2023 15:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEA5C433C7;
	Thu, 23 Nov 2023 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700753861;
	bh=uQXiq96nO9VqagRTVjE4tsnRbIa5zMx/56VxvD4vqmc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MNbX5XYoqyBOdgPdCyGzkWB4YkNNJx6Bb6oX+qx8Q66cZfm3KBHY+aafog/SV6IFL
	 +rsfrj+JI8rU872TJebCWAvHnhKhkpFt92dlQlKtgkB6ulGXBgBmgNkte9YwWzYnWh
	 6Wh/0gBvUrnet0wg1xSvGqMNlYpZ2NxE54kxpzMTpqx3hczB1PiNI3SsxxOdaa3rkn
	 RpTmcDL98KGaLcTavywN1D6rp7FipD/6ygRWtUilwXJ3KMnl3c20hEVQjraOopyvY8
	 9eD/yuTL8K+rqNLTS/xGb6pQiueDvG51NyX4i03cDGd7VfqQik9mczivvqVTV+vWvK
	 maaAzVZrWWQxg==
MIME-Version: 1.0
Date: Thu, 23 Nov 2023 16:37:36 +0100
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v4 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
In-Reply-To: <CAAOTY__LqKkj7Exg=wr0QUD-AQ_i3adXLUSdT2M_oYj7iCBAKQ@mail.gmail.com>
References: <20230905084922.3908121-1-mwalle@kernel.org>
 <20230905084922.3908121-2-mwalle@kernel.org>
 <93576c3b04c8378c5c9296ec7a6585d9@kernel.org>
 <CAAOTY__LqKkj7Exg=wr0QUD-AQ_i3adXLUSdT2M_oYj7iCBAKQ@mail.gmail.com>
Message-ID: <27e0368bb6dd44cd8d176c824cbfe464@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_073746_267361_EB825AA4 
X-CRM114-Status: GOOD (  17.95  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, Stu Hsieh <stu.hsieh@mediatek.com>, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

>> > mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
>> > always have the CRTC with id 0, the ext id 1 and the third id 2. This
>> > is only true if the paths are all available. But paths are optional
>> > (see
>> > also comment in mtk_drm_kms_init()), e.g. the main path might not be
>> > enabled or available at all. Then the CRTC IDs will shift one up, e.g.
>> > ext will be 0 and the third path will be 1.
>> >
>> > To fix that, dynamically calculate the IDs by the presence of the
>> > paths.
>> >
>> > While at it, make the return code a signed one and return -ENOENT if no
>> > path is found and handle the error in the callers.
>> >
>> > Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting
>> > possible_crtc way")
>> > Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > Signed-off-by: Michael Walle <mwalle@kernel.org>
>> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> 
>> Is there anything wrong with these two patches? They are now lingering
>> around for more than two months.
>> 
>> Unfortunately, patch 2/2 won't apply anymore because of commit
>> 01389b324c97 ("drm/mediatek: Add connector dynamic selection
>> capability). And I'm a bit puzzled for what the crtc_id is used
>> there because I guess it will have the same problem this patch
>> fixes.
> 
> Please base on the latest kernel version to fix.

Of course, but the question is how to fix it. Maybe Jason-JH.Lin
can help here.

In any case, please pick patch 1/2, it's independent of the second
patch and should still apply.

-michael

