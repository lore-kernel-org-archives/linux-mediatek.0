Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ECEC7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 11:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JcaGk53DfoljsKEc0Vqh4/+1ZEOZS900niaaCgJ++s=; b=YP5aIyp60FcVDbGy00l84Y6F4b
	IViQivEVT+4SGZfQnlrsu/w+BhxYJOUH0Hf04kJiXJmMo+c/4aHJcvEFLq/THV4RCgdTKGahjmQDR
	rTnAKw2WSUKxkkz6zB8YR3fOR4jXragmZwuB29Lf5ELjqPU0jpVTKGmRyEMIlJuFef5e1lIEEp9WE
	INAio73F27h+rNfyRTrpXPwtPFBdNn6n88uueRNPIJWMRW0blvoBi3cKcxsR9gdtbL/Mt/FIgtJBI
	2rGYpZyEw/aaTEB1GAUdLw3jA7BHMIAIcy5N4NFe8Za9ku8FlyswjsrPUTEvHZiVOHOGAempeBl+m
	9ZcLBi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xNw-00DcHE-16;
	Tue, 30 May 2023 11:19:28 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xNu-00DcEU-1P
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 11:19:27 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6261616efd2so12629076d6.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 04:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685445564; x=1688037564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4JcaGk53DfoljsKEc0Vqh4/+1ZEOZS900niaaCgJ++s=;
        b=C2wDD805ebGsBV7b0K81S5Eb8pSn0DdvY2plhQ2gb9qX9Yc7JMgWFs16+iG8k/PL7d
         Vh/G674aaMIecEd3AsU84A9PZcegaZiYkUvaOPXzGWz86nGsaE2MdYq2fTBWcpfJ6+0c
         u9ZBexHLihF2fVBIfwb8eYxzRM2sZgPSBcCeNASGxO0CBKjpGu1owbw7G3ZDuxQoYCKh
         q0Mna3NfUGyNzTuPtoUnsXvzvLH/2PfPj+NfwjTD3vxmin6ybiA43QNaW8kVxJAiE/pa
         h8TxQs3NRqxvWg+s48i59MqnlRuUnd3GxL8Gw11vw/bMS0gTFI1XQ+6JeJxWyJ1zhcnB
         wJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685445564; x=1688037564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JcaGk53DfoljsKEc0Vqh4/+1ZEOZS900niaaCgJ++s=;
        b=f/RrECu1VZB2H8uKG+NEb52SABpvhK/kG6n8SVKstUf4NG5c+K2JfS0FGtSRVJ1yOg
         xntYGsFfxpnY2Mpezifjaw6qQh9Kx3FqXy7Pz/xwCAsg51jHuOPbOhwU8ehcXbi/GghA
         89dPdKUef4gzVCx802sEKZkZFmwmGwhFdx9gbEYs9iir4NLHzhuPiwYYL6le3NxBrBdw
         SQiIDhR/aJNYibFwrT5Yp6umrCNRH3neUyjvyEr1RCIlaPOGK6umbwQ9bX1Oy6ks0pfX
         FquYcPQ/2Z+mDqVe0Bmcn8F6wZsj5N9PQ2FX4ngUFwtU5GEgUQjgzr1EAIttqGrJuIlY
         C+Yw==
X-Gm-Message-State: AC+VfDwKX/kxJWkp7jz0mRTZi+0vLFQzgvfzhaWxg2xl/hbCdbr7RKdL
	ROSKuTO/xpjlK7z5W/InCJJrmP9Mh6MxA5vGjuY=
X-Google-Smtp-Source: ACHHUZ5DBOUiWsRXCdlSENWFz5Kmv7KFin+OkFZ+1MD7nnexfUJEN1pyBDQ9HHsusXK2WSP6vMn4DZZaMjG9/b5DC9E=
X-Received: by 2002:a05:6214:2627:b0:623:c96a:e735 with SMTP id
 gv7-20020a056214262700b00623c96ae735mr1861312qvb.1.1685445563839; Tue, 30 May
 2023 04:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160352.19704-1-osmtendev@gmail.com> <87v8gajeni.fsf@kernel.org>
 <CAK6rUAPUKNREyYL-d5Y23SOV__-zPY8KJL+MMzWX8ShOhDGWLA@mail.gmail.com>
In-Reply-To: <CAK6rUAPUKNREyYL-d5Y23SOV__-zPY8KJL+MMzWX8ShOhDGWLA@mail.gmail.com>
From: Osama Muhammad <osmtendev@gmail.com>
Date: Tue, 30 May 2023 16:19:13 +0500
Message-ID: <CAK6rUANkoGLAMSQjy5Wrav02u10MKxK8ov1Xekq-goMNu0Tcug@mail.gmail.com>
Subject: Re: [PATCH] debugfs.c: Fix error checking for debugfs_create_dir
To: Kalle Valo <kvalo@kernel.org>
Cc: nbd@nbd.name, ryder.lee@mediatek.com, lorenzo@kernel.org, 
	shayne.chen@mediatek.com, davem@davemloft.net, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_041926_479544_22992C2B 
X-CRM114-Status: GOOD (  23.81  )
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

Hi,

In the previous email mistakenly I have referenced debugfs_create_file
but it's the same for debugfs_create_dir also.

Here is the link to comment above the function debugfs_create_dir
https://elixir.bootlin.com/linux/latest/source/fs/debugfs/inode.c#L564

Thanks,
Osmten

On Tue, 30 May 2023 at 16:02, Osama Muhammad <osmtendev@gmail.com> wrote:
>
> Hi,
>
> I will keep that in mind and send with the right subject while
> submitting a revision of the patch.
>
> Regarding the patch after researching more into it I have come to know
> that the debugfs
> API will not return null on error but an ERR_PTR. The modern wisdom
> about it is to ignore the errors returned by the function as stated in
> the comment  above the function debugfs_create_file.
>
> > * NOTE: it's expected that most callers should _ignore_ the errors returned
>  >* by this function. Other debugfs functions handle the fact that the "dentry"
>  >* passed to them could be an error and they don't crash in that case.
> > * Drivers should generally work fine even if debugfs fails to init anyway.
> Here is the link to comment :-
> https://elixir.bootlin.com/linux/latest/source/fs/debugfs/inode.c#L451
>
> Considering this, I will send the revision of the patch by removing
> error checks. Please correct me if  there are any concerns with this.
>
> Thanks,
> Osmten
>
> On Tue, 30 May 2023 at 15:29, Kalle Valo <kvalo@kernel.org> wrote:
> >
> > Osama Muhammad <osmtendev@gmail.com> writes:
> >
> > > This patch fixes the error checking in debugfs.c in
> > > debugfs_create_dir. The correct way to check if an error occurred
> > > is using 'IS_ERR' inline function.
> > >
> > > Signed-off-by: Osama Muhammad <osmtendev@gmail.com>
> >
> > The title is wrong, please see the wiki page below how to create titles.
> >
> > Also no need to say "This patch fixes..", saying "Fix..." is enough.
> >
> > --
> > https://patchwork.kernel.org/project/linux-wireless/list/
> >
> > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

