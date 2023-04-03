Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F85C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMcetHB9pKaKjInDp3NitSfpRNsMYptGuZlPIeoW4f8=; b=MnGuSRwfu/1UqCkXNmH+pT2AmR
	HF+Agun5qpjBNMpNOOIYR95iEXleqotPtIbhfAEnCeqvJu/1hUjnaz6uroCW+EGWNhbDOc/ax8Nc5
	5V7rJx1zq10gs3nBGjhj2Zg0WJXMpFKzYxymDq1W7j/mM5tc6Dj4/vk1meDA2BCtY8SJvy+y4qqCs
	qNFr2yMfTQvNymGQLsx9Bbe91+99Tnq5uBq0s2p1UkG7A7JGn/r8Ujj5/6i8SufIY4njjGXC6FedH
	PnrpmLMEmO+y9E9vgnLoFlWnk1ksnr3ujLlER1ULvs2+YYYJe4VQE9hLy9r/YqwdOaU3KusuPu6b8
	NyVDJi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjENK-00ELTi-0k;
	Mon, 03 Apr 2023 07:13:10 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjENG-00ELSL-16;
	Mon, 03 Apr 2023 07:13:07 +0000
Received: by mail-ot1-x335.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso15105079oti.8;
        Mon, 03 Apr 2023 00:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680505985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMcetHB9pKaKjInDp3NitSfpRNsMYptGuZlPIeoW4f8=;
        b=U0ff180486/xeXNhJphbGwtfS6hZz5jep8XMcCYs5K9mCo06lWbhYGkgCanfpzfXBv
         13VYZGu/qgH0AOATH5si+BkXZlOBNFqB0+AoQ+zoAEkXq3gIsSjDhQpkNlJzGrIXApFr
         stbMeBqXlyewqJFHPVeR7F8fjl1FTKSQttu3mSUG6w7vT2GPrIs5dFjtHZnXjoH10G01
         Fh7lNT2153v1FNTxlwAnONCYOK57oiN17hmrGuUs+s/piBH2BHpvpQm2vDH3Qf6xHRwJ
         F+ET5ksAUswrsSIWkQU96cjbKDEjp8Dnv4SrXlrDcFDnxKz37cCYm0T/IUiEWWaYMlOP
         9cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680505985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMcetHB9pKaKjInDp3NitSfpRNsMYptGuZlPIeoW4f8=;
        b=2xeCVIPj3QeyEtW37hP0IgzQmsU2db4NUDnuxWX6Rvb0ZyP5ToN/N68C3kQ35ymcvc
         ZTeQRynlDu/ZnPPcp1dCB6eClgtGVb2mVdxAGtl4PHXV2UX5UrJi2FN3l3AVfK92sirH
         irIMubr6GB2nkxsqJpGRkKS3rUMT3ttdABeMqK3CjfPVRpoP/Yfzcu3R2PY0qezojZn9
         2KwbZupSE3DEMI8o9jUrRt2RTif5R5510Coa7aJKm4u6xZysOhG56+aZYmLLTZZvg1YY
         Ijf6u7kPeqyMWzIaYtFs+JjJed3nCG2667iTcdaQbhLRYJKz9v+v7VFDFc/2Qf2s0uwg
         qS8Q==
X-Gm-Message-State: AO0yUKWGBOmHcZ1LZKzvCVh4XRq1Dn2L29b0htHEDBBgHIySkbqHyc5H
	/SMWQ8v9v43xcnwYNm5iYX9XLfZ8XgWyTypH0plM4OUu
X-Google-Smtp-Source: AK7set9Z4atpGQ9Kueh0VT32eavgpOiqvMFER0Up82yH5croxGA4rfWlDf/WSwdQ6qw4jEi1aUAM1UuKL7OZ8lMeFL4=
X-Received: by 2002:a05:6830:2:b0:69e:24a7:e042 with SMTP id
 c2-20020a056830000200b0069e24a7e042mr10954719otp.3.1680505985269; Mon, 03 Apr
 2023 00:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <202303231145121987818@zte.com.cn> <22081108-565d-4608-97f7-6e40ca3df2b6@kili.mountain>
 <CAMhs-H9m=ZGREMo_upE3M48sQb-WpU3j2_b2xLyO2mDkezxC9g@mail.gmail.com> <4cfaa4eb-24ff-4129-b549-bd5a66352e9b@kili.mountain>
In-Reply-To: <4cfaa4eb-24ff-4129-b549-bd5a66352e9b@kili.mountain>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 3 Apr 2023 09:12:53 +0200
Message-ID: <CAMhs-H_TFe4brv2wrZgMGqB60SEsqCieExHXa5vyuugHatz1yA@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Use dev_err_probe()
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, ye.xingchen@zte.com.cn, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, lpieralisi@kernel.org, kw@linux.com, 
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_001306_376755_AF5F459D 
X-CRM114-Status: GOOD (  20.27  )
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

On Mon, Apr 3, 2023 at 8:11=E2=80=AFAM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> On Mon, Apr 03, 2023 at 07:05:56AM +0200, Sergio Paracuellos wrote:
> > On Mon, Apr 3, 2023 at 6:41=E2=80=AFAM Dan Carpenter <error27@gmail.com=
> wrote:
> > >
> > > Hi,
> > >
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zt=
e-com-cn/PCI-mt7621-Use-dev_err_probe/20230323-114623
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git n=
ext
> > > patch link:    https://lore.kernel.org/r/202303231145121987818%40zte.=
com.cn
> >
> > So, I already replied to this proposed patch clearly saying that this
> > makes the rest of the code unreachable, so it is a clear NAK.
> > Why is this applied to the intel-lab-lkp tree? Just to be able to test
> > the changes?
> >
>
> These emails are automatically generated by kbuild-bot.  I don't know
> how kbuild-bot internals work.  I just review some of the Smatch related
> warnings and hit forward or ignore them.
>
> Normally, I don't look at the context outside of the email but to be
> honest, I was curious enough about this one that I looked it up on the
> list.  I knew it was NAKed but I set the email anyway hoping that maybe
> people would see the extra Smatch warning and be encouraged to run
> Smatch on their code in the future to avoid potential embarrassment.

I see :). Thanks for the explanation, Dan.

Best regards,
    Sergio Paracuellos
>
> regards,
> dan carpenter
>
>

