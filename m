Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F136FC61D85
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:MIME-Version:In-Reply-To:
	References:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImxWZyQw+OzqcqVpcmrRNXVgXf/9MkOc4lXvk9lNMHc=; b=yubXUNciV1TKAh4Rby4H4+220a
	Yt9n+43zmVH9sOc3760jtMN89qdH/xT2WqaJFhevqOqi6Q6lS6syhO6PV1HsgfiHmU4TbVB8gWjkd
	ci84vl5gwYccB4LEoQr+OitugAMXU3qvDL/vWFbT2MjzO64OQbLbCybJKlTNPd6Rh/BN+yos2L8K/
	p4iHjsvBPdQaE1WJM2SmsIi/6Ykvv3gBGNriVZSbBGvxTDnwUaSOtspZ+6D85VarPtvY/7BUMuzCr
	LRduYTppq8O5+rUT16l9YOKDAsoBcpSJAhL/MtOwV9cxaDqX1WmGU8zKnGMjpOVZDdItqDU+MT1bZ
	KfdaaqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Rvy-00H3AS-2k;
	Tue, 21 Nov 2023 14:41:02 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Rvv-00H38Q-00
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 14:41:00 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1f0f94a08a0so3336462fac.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Nov 2023 06:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700577653; x=1701182453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:in-reply-to:references:user-agent:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImxWZyQw+OzqcqVpcmrRNXVgXf/9MkOc4lXvk9lNMHc=;
        b=Jdj/IDq7XLLYc84CXRCEbNj48nYua68BJTpxR6ki5pL95ZfDU/aotwTX9b1zKI4GiZ
         rkpfnkiQGbJunGYIpUD2f+AM0ZWEojmvoZ3je4XPTFkUoL7+OKymIZNU5hFMH7krY1P8
         okQetoKlCXrLWl/GHe1Hr25Zk1wyAtniCJylFZk6cUgb8iQOGyvzi8nP5TZ90sJwQ8lp
         tInykBihWN0/eT5URW4ZVcpRc2ntzMsOn8d+Mk5MEOhQyKUnmEJGNEvOVKy2o5BuD8mH
         WGSafJrJTgD+UIICm0fa8a8HDDd/aNkrR+1Nwacd0RWNs+F79ljhYMO28S6mKtyAkxUf
         PFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700577653; x=1701182453;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:in-reply-to:references:user-agent:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImxWZyQw+OzqcqVpcmrRNXVgXf/9MkOc4lXvk9lNMHc=;
        b=FqI6rkQwf1TCvtQN3/lkluo2Nos8/33X6DtFRW52tBIriYvKTl5fDg+mbDt/WHhXCZ
         SH++Mg8qCEE6mv0j+PXAVdQRca21bz0krHu86vXC9c0TxgV5i6MGZ0jBzb3evbxi8FpP
         HBDaLile6Tzbbqct8uo3F/CCQX2rG4m+G0Z+ifl/hHWTk4HkFcFtYXjJDLWQt0ZAQBhg
         C4QmO0DGdMo4JbFeASE8UwXeeJSIwllCO3y370eZy/HRjZ9F3mSZPVFjGGCfk476Rvpq
         fV42R1YA1I7xh7uPNmYbCosFHuk7d5vj8DWDtFDWrqnfxNlI8F7m7XZ8F6/+APLGcef1
         K+8g==
X-Gm-Message-State: AOJu0YwcEuYwrHE/OCa4EHPzn2Bvx4iZga/ZoJH8aXMkiW7X0VCl8Rzk
	4DUOzxws9egHOXAFZAn5EIFjtgRLyKLJY7zYgtq+iw==
X-Google-Smtp-Source: AGHT+IEMmr6OYDSX2nS5vNaDx2wFqAkHqsQ/xko6HAJB9cs9kRZI2B37yAeB6rBMLaCK23pkXxmz2pO5+KzJ323xLhs=
X-Received: by 2002:a05:6870:3b85:b0:1f9:36fe:fd0e with SMTP id
 gi5-20020a0568703b8500b001f936fefd0emr5880414oab.47.1700577652158; Tue, 21
 Nov 2023 06:40:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Nov 2023 06:40:51 -0800
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.3
References: <20231121142938.460846-1-nfraprado@collabora.com>
In-Reply-To: <20231121142938.460846-1-nfraprado@collabora.com>
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 06:40:51 -0800
Message-ID: <CABnWg9uqPc20F93GF_wF2_o4hq9zdAJtyoa8_iMyM8gc9owDXg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency
To: =?UTF-8?B?TsOtIGNvbGFzIEYuIFIuIEEuIFByYWRv?= <nfraprado@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Bo-Chen Chen <rex-bc.chen@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Guillaume Ranquet <granquet@baylibre.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_064059_064929_DF6F55D0 
X-CRM114-Status: UNSURE (   7.41  )
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

On Tue, 21 Nov 2023 15:29, "N=C3=ADcolas F. R. A. Prado"
<nfraprado@collabora.com> wrote:
>The mtk_dp driver registers a phy device which is handled by the
>phy_mtk_dp driver and assumes that the phy probe will complete
>synchronously, proceeding to make use of functionality exposed by that
>driver right away. This assumption however is false when the phy driver
>is built as a module, causing the mtk_dp driver to fail probe in this
>case.
>
>Add the phy_mtk_dp module as a pre-dependency to the mtk_dp module to
>ensure the phy module has been loaded before the dp, so that the phy
>probe happens synchrounously and the mtk_dp driver can probe
>successfully even with the phy driver built as a module.
>
>Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver=
")
>Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabo=
ra.com>
>
>---

Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
>
>Changes in v2:
>- Added missing Suggested-by tag
>
> drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/=
mtk_dp.c
>index e4c16ba9902d..2136a596efa1 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -2818,3 +2818,4 @@ MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylib=
re.com>");
> MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
> MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
> MODULE_LICENSE("GPL");
>+MODULE_SOFTDEP("pre: phy_mtk_dp");
>--
>2.42.1
>

