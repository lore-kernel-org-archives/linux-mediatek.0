Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DCCC4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul/vL+oJkRgYUPa1hDePq1cyQcdFp3HR4K17flhmqx4=; b=O+Njt7MjTdj7KdA2G6d6oGIlG2
	pXLAJ1wTx3dT+udOpwyhJjeGbOrl36ctBile6G1Xik0bbVf6vlJL6R6yineaoLuJX7Wbpl9yo8TAn
	sDuSbaWPjMksJxWrxVgZsl3xLzbWukAup1lod4ASyAVEkbxiRPvI79T44nhYFOt9EeF/st8oultOS
	dy9ejRaDeD742DuJYR0WKFmb1CezzL2Luq7bm//mshUhbBIF9uIDmvGkalRoZBMg3YlZLAkQf6PJO
	m4OK+xhLJTwIz+CICl3h3VZOXr6vDcTDaoijGtxV2SoHUbnwszOq3mvksaewSfec/pD/L2H5F1xk7
	MqNSMaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcHG-00000009vR8-1FT7;
	Wed, 07 Feb 2024 07:23:26 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcHC-00000009vQM-1Qi6
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 07:23:24 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-604983ea984so313947b3.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 23:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707290600; x=1707895400; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ul/vL+oJkRgYUPa1hDePq1cyQcdFp3HR4K17flhmqx4=;
        b=AfSEt77M0JfTq1JGBkbJ45w0awbHBkyM7jz2NEt5aemDqqqbEXPhiJWIxXXVARQD1m
         pN9lZJPcBxMHqOcgwdctMRpVEDxivpH/tos4q5OG3ueI0BOnu9WtcvBfXI4yuxGqb2QD
         uAQIVuKCOrMHV31TtNqV+9HUktIQahM2/Dbv+DvjwDfsl8NgPln0yfMR6sLaE5WZDS2/
         QMIHSw2FJSjz1+gN1d7wvq99qH9HuE4y8vxXqkl28EhyktgAANqKU4Ch7BLjOxxS2pO5
         /+ry2WVpr6mPSBEzZcY5t5AIMQ33gL3CTVVLXYsvmPhiI+DRyzly6gUbWtd9vTjtI/G6
         YaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707290600; x=1707895400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ul/vL+oJkRgYUPa1hDePq1cyQcdFp3HR4K17flhmqx4=;
        b=DmH2FyK+awQ5l+aBeYFmoSsbMtbgZV1LWGG/BjWnyvB4DNngsc4MGSI7E/6xL7EsPT
         dllOwXsGfo/MjihBWw7QerNoZEuOMuLHt951e7Ws10WA8wD/bWlgrWCOgi5FUWM9In2V
         Lh2zlJPgrizr0c72e1GRjkNeGqKZKnpTkl4hAzn8eoIEo408dLhPsYWGBhUw9jMbpv+E
         4itu8pK7Ahd9JjJoDz40e2Yxw4w7DzXxPAruOO/6n75lRGvTOJ11ragZZmbK2YxTByLf
         J+v9hHe6pV2aFLTQZeuv8J07dVpsSQ+hXgSnA28+HWe63nKA02gSVrgs7wRt6A4KADJo
         1BdQ==
X-Gm-Message-State: AOJu0YxiU0D2ThWeY/u6sxOxEiFNqPNXGD2oVSGIf9oVctT/pLiOr2kN
	z1dQKqYpvxYJzh/kawBHxLrlV3GwROyxtVBl9H/E8eWCjx+pU323rWx3Rd8QhA5XBTT0+fUsloV
	P0iyIYfmQ+RaVvW/n0eiqLc38tLDrGZtZYGU9BQ==
X-Google-Smtp-Source: AGHT+IFmSPUVi9I1FzvhN0MJUCfEDi+UeMDB4xdBNbC5glZo8HfXW9t8BlXXiKbrYvcPLJEmEfspsezUlkHKpyHMv94=
X-Received: by 2002:a81:4148:0:b0:5ff:92f1:8e24 with SMTP id
 f8-20020a814148000000b005ff92f18e24mr4344209ywk.48.1707290600212; Tue, 06 Feb
 2024 23:23:20 -0800 (PST)
MIME-Version: 1.0
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com> <ZcMvFtAwQQjAZhk6@linaro.org>
In-Reply-To: <ZcMvFtAwQQjAZhk6@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 09:23:09 +0200
Message-ID: <CAA8EJprqWLX7_yWZzKp3FAKFGkSkk041f9hj1uXuRBrbH5APyQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_232322_412408_0D1859F8 
X-CRM114-Status: GOOD (  25.75  )
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

On Wed, 7 Feb 2024 at 09:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
> > On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > Some newer SPMI controllers support multiple bus masters.
> > > Such a master can control multiple slave devices. The generic
> > > framework needs to be able to pass on the master id to the
> > > controller-specific driver. So do that. The framework will
> > > check if the devicetree child nodes are actually bus masters
> > > and will register the devices for each master. The legacy
> > > approach will still be supported for backwards compatibility.
> >
> > Please remind me, are those two actual bus musters driving a single
> > bus in parallel or two SPMI buses being handled by a single device? In
> > the latter case this implementation is incorrect. There should be
> > multiple spmi_controller instances, one for each bus. Allocate them in
> > a loop and set ctrl->dev.of_node after allocating.
>
> It's two SPMI buses (two sets of wires) handled by the same controller,
> HW-wise.
>
> If we register two spmi controllers with the kernel framework, it will
> be HW inaccurate, because there is just one controller which has
> multiple masters.

struct spmi_controller is a controller for a single bus. Inside your
device you have two SPMI buses, each can be controlled by its own
struct spmi_controller. Just like devices that control multiple I2C,
SPI or USB busses register a separate instance of the bus controller.

>
> I'm not saying it might not work. But, to me, it looks more like a hack.
>
> Basically, we would be mapping HW bus masters to kernel controllers.

Buses, not just masters.

>
> >
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/spmi/spmi-mtk-pmif.c |  6 ++--
> > >  drivers/spmi/spmi-pmic-arb.c | 10 +++---
> > >  drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
> > >  include/linux/spmi.h         | 10 +++---
> > >  4 files changed, 67 insertions(+), 35 deletions(-)
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

