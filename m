Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52895EC875E
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 02:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=; b=EEZpFPrK4NwyyEa5VtviJ8O1Hx
	wYFWfyoNMUq+1GWjcbwH0qSlK6byKCUaSQrneReX/5XVZbpSs6oDR4CniS/vDMboBlNxxYTkddniB
	cfMM0QbljBTTZeDa2+wladaFrB2L/oK5M0S8Ud++RA6VGYyf9kuQGYsSmxU0A9MW23tflKAqjKhdR
	yfTPB0yFyU7tk4aU4yvv6FfP52Wkxt3/Cm7s1iSEZK1RVG/zzHjYJcHQ+oem21f1PrmPpdXfZJilx
	ZKyA2wEmn+Dh9xOJPLZQjcrp8auGcczTKbhtOyzpaBP0cHBGNhH18V0xY15V4SkELYhxYObWICa5j
	3vIQtK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeQpp-00Cv6Z-0w;
	Fri, 08 Sep 2023 02:03:01 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeQpm-00Cv5i-2F
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 02:03:00 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-490e78ae83bso567817e0c.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Sep 2023 19:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694138575; x=1694743375; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=;
        b=Oq/zto3g1HV63Wlb7IpUwma1aj0enKWSkhm40kggBc64emSVVhKVBk/4RU6+xB9RzB
         Vvnxry7+GunIcLkJTFFU01c5io+UoQaC6GKHLuIOYN9F/ga+SfyS+l/TR1+9hkpnStRD
         jGeqVylmRsqh79oj33Keicfz2ZH6PvIelu2+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694138575; x=1694743375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=;
        b=rgCGyNVNfv/ufHSBENnUroiwifZmpkfyBRzGqMen6bixtJQc0I7bimMUitBNYd0y5Z
         wf7tha4mBe6JDVhtZgGQoIIeDMK1wge6awdNG/SUEr0uwYDQdmcHxzfzcL/5KqwLZKZI
         O/Ig05NkDL2wEPdR13hVBGMf3k40PvhFAzODOFz8faRO3+48IhCYrqE97LZE8ED4yaeF
         Q7CRam5Mmq56WjQDQ4GB7QAYTm3XmFnSK3X+ot3gWFGhXz5+HQN+/r+HZD0ukhXzCtAk
         7iuwPg+xAw6YU9MDE1iR12nzTtEkABfPofdeFM7ciwwYkC5cAwFVoSBeYhPgQhKxgeqb
         U1QA==
X-Gm-Message-State: AOJu0Ywa58WHlHD5pdjnVbzG6zjDmQr0YvvLrSZXd1T1m/eVe3eO5KRT
	QmCS6GDOsNmki9mZaWFeSPAEppNpPER41sGePhM=
X-Google-Smtp-Source: AGHT+IFbgKPcQZDMvrMxX8/ndS2+WX2O5cyoEbSvGWHHtvMHbddcQzLuycblJdFSyfKQDS1ESOgbvw==
X-Received: by 2002:a05:6122:2ab:b0:48f:c07e:433a with SMTP id 11-20020a05612202ab00b0048fc07e433amr1706775vkq.11.1694138574799;
        Thu, 07 Sep 2023 19:02:54 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id d23-20020ac5c7b7000000b0048689462889sm179757vkn.46.2023.09.07.19.02.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 19:02:54 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7a7d7a3d975so337101241.3
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Sep 2023 19:02:54 -0700 (PDT)
X-Received: by 2002:a67:fc05:0:b0:44d:3bc0:f1ba with SMTP id
 o5-20020a67fc05000000b0044d3bc0f1bamr1510797vsq.26.1694138574367; Thu, 07 Sep
 2023 19:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <4b2ee1382896dd7ff27ecbef6e1ad496edccd3ad.1694129223.git.objelf@gmail.com>
In-Reply-To: <4b2ee1382896dd7ff27ecbef6e1ad496edccd3ad.1694129223.git.objelf@gmail.com>
From: David Ruth <druth@chromium.org>
Date: Thu, 7 Sep 2023 22:02:18 -0400
X-Gmail-Original-Message-ID: <CAKHmtrSRoAWa9bErAdE9dRcFk37L=LZW7T5bpOpF9aC_REiw1w@mail.gmail.com>
Message-ID: <CAKHmtrSRoAWa9bErAdE9dRcFk37L=LZW7T5bpOpF9aC_REiw1w@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7921: fix the wrong rate selected in fw for
 the chanctx driver
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, 
	Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, 
	km.lin@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, 
	jsiuda@google.com, arowa@google.org, frankgor@google.com, kuabhs@google.com, 
	abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_190258_814919_F96DEE1F 
X-CRM114-Status: UNSURE (   6.26  )
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

Tested-by: David Ruth <druth@chromium.org>

