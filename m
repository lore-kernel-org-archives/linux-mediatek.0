Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B57C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 20:08:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F84F21BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 20:08:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eRavBxoh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F84F21BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tZWAC+Im44VJ9gO+jDXCx3jdOS3Dh6VQC81jnzhogi0=; b=eRavBxoh8KgLzhZcRsHK8ptke
	9sBJpkB9oJf8PlHMOA1HEo8JAuQYXCR0BEoE6PSuQnC1b25Ck4WoJPAGq2s63s5fZAFNKfQEiZbQf
	b3hm/hsOqrBiZyyO3zfOSuj50rxXiNC+yE1Hia2RZ6SjwLQ5RVHsi7MLqY4tMzHaskrvfckUhRKHb
	Z2FEuDjP86ZXytYbbpxdmAnKcJ1I1+GPwhm/0Z8OTLGSUc0bVJZHdLV0Rl0HJdylc2IymdxJdcbgE
	/Cm9myLMuNa5+thN2KWJ6RDQi5hUIXQc0hxTx+BIJQKSJk6fdaGIz+UTTKLr3QlOIgtj0pZ7/BEYF
	OGoyEetpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX8nO-0006cq-3K; Mon, 26 Oct 2020 20:08:46 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX8nM-0006cM-8H; Mon, 26 Oct 2020 20:08:45 +0000
Received: by mail-ed1-f65.google.com with SMTP id w25so10875697edx.2;
 Mon, 26 Oct 2020 13:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QAhJNTcBuylpc827Gc8DE790mcWVOqgUgREe8IN9rGk=;
 b=nDgDSM0f13fh2VAPU1aJ3VKdg4L9UAIBihS4S79ovDAiY86hnAXGDrU20Fn79bnjpE
 q1arUYu5MdIggNqHEBQm6Tu4T4cXX5bTtLsindxhDQd2sSCcxNgY01mOuCBsPl66663e
 8lU3asZ2Gi/qnaMY+SzLSaL4P/Fm9sdwuT8tV+QeUh4OyUhLwPW2157IFJ6mqkd/zXb8
 AlpqGWXRdsRjcpQdWqHG4lOQMTObQPY1xcqBI6reRwYcfgeas4PTxsPa/+4VN/MblsYS
 6L+ICgBdplQsUOqMc0HTglNEXf5NzWCqgW4Ss4rO7BmdA8dNf0gZvzKjvIE+ncZS67mi
 nc/Q==
X-Gm-Message-State: AOAM531kQkH2aRqu0zT9ZdVQg+GHKUrPsRAZu9ywO1cS1a/H9sTyLgzW
 tHCuU+W8RObHJ7CLiA8ch4o=
X-Google-Smtp-Source: ABdhPJyeTtkh+7BD+iZP00A29Rs+E9CbsQNM30SNnmXJaudtE/elyiDZQpiu12bDhX/8rOr3FlmfEA==
X-Received: by 2002:a50:fb0d:: with SMTP id d13mr17781115edq.85.1603742922751; 
 Mon, 26 Oct 2020 13:08:42 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id f23sm6453141ejd.5.2020.10.26.13.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 13:08:41 -0700 (PDT)
Date: Mon, 26 Oct 2020 21:08:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 00/24] MT8192 IOMMU support
Message-ID: <20201026200838.GB240203@kozik-lap>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_160844_359500_E10184D4 
X-CRM114-Status: GOOD (  17.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 03:06:23PM +0800, Yong Wu wrote:
> This patch mainly adds support for mt8192 IOMMU and SMI.
> 
> mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> table format. The M4U-SMI HW diagram is as below:
> 
>                           EMI
>                            |
>                           M4U
>                            |
>                       ------------
>                        SMI Common
>                       ------------
>                            |
>   +-------+------+------+----------------------+-------+
>   |       |      |      |       ......         |       |
>   |       |      |      |                      |       |
> larb0   larb1  larb2  larb4     ......      larb19   larb20
> disp0   disp1   mdp    vdec                   IPE      IPE
> 
> All the connections are HW fixed, SW can NOT adjust it.
> 
> Comparing with the preview SoC, this patchset mainly adds two new functions:
> a) add iova 34 bits support.
> b) add multi domains support since several HW has the special iova
> region requirement.
> 
> this patchset depend on v5.9-rc1.

Hi,

I think there will be v4 of this, right? If yes, please also describe
the dependencies between the patches. If the entire patchset is strictly
ordered, then mention this as well.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
