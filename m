Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61FFEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrCUDL1/u3mCyL3fGovIg+T0/y0vvq0Eia4n2zK2lnk=; b=Mk0QXKOehE38gWvKM9/UV5SeMf
	nq2TGxKr2/UooMC7YzAV3QnbCk5KIF14EG5J59CP2RIJc4sL3IBpcnWz9KJ9gfJUCtHxklia1qTzn
	7t1+DZRWMGMWWxvrwysAvih48ZWW6DqxuL53iUwwtW4ElaR2aJZxG/cc4XM1a3q0GBZDW0hfv9v9w
	l3YP2SJ2KERRorkawHIe4c2DXmVm0BRGJQUi51y9aYCQrkZrB61OITiFFAp0gqUPJ+VBFtbwwm2wV
	zmBHHbsuKHERZc3vcuMJukHxXFDUH2/RYLuXsG+M3r1y2Cr7Z8nwPiDZUJmUhCJGbT91eJIyFFU82
	2qG1wieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM040-005QbS-2R;
	Wed, 19 Jul 2023 05:49:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM03y-005QaE-0E;
	Wed, 19 Jul 2023 05:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CrCUDL1/u3mCyL3fGovIg+T0/y0vvq0Eia4n2zK2lnk=; b=daduoxx2WAvxx9MuaM96whrwZD
	yvPbr/OBjyezfQ544RmmeYPjH9ZIb1ktgAf3jogCwE9QJgv/um4uaz36oU2C2Pd/mCbRVs+HP+xgf
	nJiD988OS09b4tdOwIcLldelqucqfD+0ctPH0E+OwRs7pB+GldH7HxVUPRkmnqqm87RYSO+c0WY9C
	laIP0MxrPI9ibuXR6w7YQ9Y/Kk0c//F4bS8KrMy53j0XrOED6vISDyVMyE/k5XDoXFJsOWjt3KWr1
	02qBcCX6uMBZpEEvOSfbzpLxzR3bz3aN2UrBnHFEPl4rJP+d9Z9iCiookG+EjtW+lQHl3XYd4FX8C
	4NyVHqXA==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLg2r-00BJ3J-1Q;
	Tue, 18 Jul 2023 08:26:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso5076479f8f.0;
        Tue, 18 Jul 2023 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689668752; x=1692260752;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CrCUDL1/u3mCyL3fGovIg+T0/y0vvq0Eia4n2zK2lnk=;
        b=Xh1x7hUKw28NMEYrDzAaVRcudSvnpr6lasTNRdoaWUAXgwI7KB5bT+Wxva/xMdid1S
         HhYAD5Oz1YtyuXF1BEKl8jR08NqP9pd9ewCvW0UHgOakDTWZDGjl8KWwRXNnyO7FJyNt
         eGPX5Rai+9fifzuMRctpSvXoy4T6CvdZDHyF7/ltGTMyQBZNRTZ5t+VXLYZmpnAp65UH
         VQbnx33fQ41PK2HNoVLn84XhsGwvxwt8TlSwsPjxmcu63jFaBIP/YYyq3PrOk2pKUvTC
         QA4xTFHe3tUP7sqsMRujqv3NPQ0JYhX7c1zDrcVgHvtHVEg9YzCjEyEsNds4oL68chfd
         3GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689668752; x=1692260752;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrCUDL1/u3mCyL3fGovIg+T0/y0vvq0Eia4n2zK2lnk=;
        b=KDm2Cro2oFAWJJ1RxgYHht+jxjkWRo1TEWaxa+2QN+ymdi08yzjugitfuUrJvxRhru
         emTUIPclU6/F8b2zR5lkHDXU9gowDH+cfgaem8MumpjmHvyCz4nwHuDrwcd8HtSzZUTD
         WZQfVXtPiCg8cmTXYx26pkPSCA48cBpDk9wHvsDADUt/EMGzuGLXdhlaScP1gJ+7ww5f
         0l9IkAd82BaJs3/YsMQ0KARDe3J8aB+49P8TsQFRcB8mewNT1u7MTsY45SD3E0XCAof2
         kPv/66/g+FZo2zxvVNIoKdq5KFp5b9kNz7cS608rTK8EIzl+ka3Sl3hmrScpq66x6OoW
         b4AQ==
X-Gm-Message-State: ABy/qLaCEm0rRNenFfDW5VKkHDPIMpM1+rpcRnVNRexS5FC2e2mz8ELi
	7YChuzl4wgdsPMrsMpQL/U0R5U/FOjAvDexOrKI=
X-Google-Smtp-Source: APBJJlFrmOa88kLbgpl12aGV9qZXGESdZ3ZjCYW1DiB7+DnP2V0y3QdQ7oGC/9IjpKPSFscpa9E1s+3h0rarAqnNxiQ=
X-Received: by 2002:a5d:4c41:0:b0:316:d887:624a with SMTP id
 n1-20020a5d4c41000000b00316d887624amr11762324wrt.15.1689668752364; Tue, 18
 Jul 2023 01:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230627164309.59922-1-dg573847474@gmail.com>
In-Reply-To: <20230627164309.59922-1-dg573847474@gmail.com>
From: Chengfeng Ye <dg573847474@gmail.com>
Date: Tue, 18 Jul 2023 16:25:41 +0800
Message-ID: <CAAo+4rXa08bRHtmwf9xumHdG=vhEFGmpT4mNycKcwDu_ewLYtg@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mediatek: mtk-hsdma: fix potential deadlock on &vc->lock
To: sean.wang@mediatek.com, vkoul@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_092657_566553_887241C6 
X-CRM114-Status: UNSURE (   7.48  )
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

Dear Maintainers,

I hope this message finds you well.

The patch was submitted during last merged windows and
I think maybe it is buried under other patches. If you've had
a chance to look at it and have any feedback, I would be
very appreciative.

Best regards,
Chengfeng

