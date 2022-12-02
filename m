Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA27AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 03:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3IEJJUdCdGG8U1WrhDSRoS/ptvIHsxOFNuOE68d/I0=; b=ajNnFCc4meDayFwtm6VNmYxFLD
	rB6LALJTbG/D3DqFESXyr1i1rGWmdBDyicTVcQczvfdL/fkCMW67eFGNSqgw7b0pFRPEWSuGr4StQ
	cSFmQ+OsF3dwuRnVYdjwTVAbsQrH3dPFMfVfpKuxFgKrvDMlrtOYXL/Ttdwersry4M0UhqcvdOi72
	cPn9nCuIMSTbEis1QnLoY4THrxScpIbPcU/Q7jq6fWvlonw0ThiMbD2Fmkhhir4s6XBabOALmxu1A
	n6BI50yKIpMsmq6iiqxHMxRCZ3r3ZQcPuoRLDUtfvEtvYg4qi/2Iv2d7u9bXuJFA3DhdIa7Yq6Bdm
	Mlb1bh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0wqN-00CwU4-DV; Fri, 02 Dec 2022 03:36:07 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0wqB-00CwQZ-5l; Fri, 02 Dec 2022 03:35:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id m14so5940956wrh.7;
        Thu, 01 Dec 2022 19:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3IEJJUdCdGG8U1WrhDSRoS/ptvIHsxOFNuOE68d/I0=;
        b=oneK4l5oRB68i/urz6v9XuyXXIAzS8mXuk7hrFMm6ySyZDysNQoJkWSAtrpATrU1gE
         qu/ph2JckzhdE/sll6ROKUMH9k5HMpskTdvwS9yz/9SpZh9V2uIvX4RqAVXyO88WNMHo
         YEIxENk68RvtdLvRiPzRNzEoUkRKGenRv7jwE013/jqnejh97o7+cnccW3SUdV8DzNEZ
         Bk2L3n3MwjHg6WwxMmwNjhAwOxlmx7pPf6KObVS08iT/mSnEwQdcFJ1s4zCQDit8JJGN
         e+W8y9Xh/RbV11aI9550ywUTpBt0iAEawQksFGtkWp2YEeLYJRtmo5C3hWhLwfRJFXs7
         Be7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3IEJJUdCdGG8U1WrhDSRoS/ptvIHsxOFNuOE68d/I0=;
        b=IPBxzFGuVwtlYL2FnH0mQnRb2RwGcWds81UGrdqh9avdAEZLnE60Uv9ptqIdQ412+N
         YjEoRvydSNzaDiMkRNk/qQYn4ANKmSzgfE0MRIRL7yPYIdhq8uC/9m3sNZlo6RHRccSg
         sgUmaeE/klz0C7Idcjz5vxAanE9FvnChpczzI8mjfTjC/5WlgKl0LcOa76+W0bwB0dWy
         txjqoNC11behNIerBS8TV8oeexbu7AIjrVaweHvlWfnQs3pUmQ6yvOoNKsukN7tcDwqI
         4AFY7CrAV1uddu673nhB3NX0zhvIIklFLDiqhgEDneErXwR3h+ckg+PzH59eS8xGThPL
         NiUA==
X-Gm-Message-State: ANoB5plBc3boiBTtQ0TWu1lRcQCUTt9I7eFYSGycCtWl/ahL4ZFJLaig
	vcT12Mww8fbiKAmaFrqthSui4GKE8Z3bZZ6GT2A=
X-Google-Smtp-Source: AA0mqf5zltDU33DVT2ReMBUccg4qtzilym5j7/G+wHcvegLvavRcRsRjBnvW+BJWA/7y6crSrtPYvambJKRmYHUaEcw=
X-Received: by 2002:a5d:55c9:0:b0:242:1057:40b8 with SMTP id
 i9-20020a5d55c9000000b00242105740b8mr16070380wrw.182.1669952147042; Thu, 01
 Dec 2022 19:35:47 -0800 (PST)
MIME-Version: 1.0
References: <1669797463-24887-1-git-send-email-u0084500@gmail.com> <Y4iTVmOA5P/aN2yb@sirena.org.uk>
In-Reply-To: <Y4iTVmOA5P/aN2yb@sirena.org.uk>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Fri, 2 Dec 2022 11:35:35 +0800
Message-ID: <CADiBU3-gr1OrH0_OtuWyAN8WwvZtPghC6zfB3NYuVTq4b+DZBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] regulator: mt6370: Fix potential UAF issue
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, lee@kernel.org, matthias.bgg@gmail.com, 
	yangyingliang@huawei.com, chiaen_wu@richtek.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	ChiYuan Huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_193555_264372_EEA1821B 
X-CRM114-Status: GOOD (  13.28  )
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

Mark Brown <broonie@kernel.org> =E6=96=BC 2022=E5=B9=B412=E6=9C=881=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A7:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Nov 30, 2022 at 04:37:42PM +0800, cy_huang wrote:
>
> > The original code uses i2c dev as the parent in order to reuse
> > the 'regulator_of_get_init_data'. But this will cause regulation
> > constraint devres attached to i2c dev, not the mfd cell platform
> > device.
>
> This is a general issue which will affect a lot of MFDs, we would be
> better to fix this by changing the API to provide a device to be used
> for the devres allocations separately to the one used for looking up the
> DT.

Not to affect too much, the better way may change the 'regulator_register' =
API.
Append it as regulator_register(dev, .....
This could separate device object with devres allocation and DT lookup.

