Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3486C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 08:13:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEBA82075D
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 08:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qmTm4i20";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="a9sOniDg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEBA82075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b+AqaqGmxblgRyTFPDyFK1oTl7WtSrwDZDqlKi3gdQw=; b=qmTm4i20vHJTjO4D9zD/FyBta
	3CT5hJHWQIcyludHL7P2rpWIxa808iIWSvi6FcJAQladSHu8dusJqj9cwLupd2F2oAZajZj2C/QgE
	Vce4uA/jHKi9VzQyLqhZx6TqWtqxv5/bvvUr1jvO22lb5eFYZf3yHv44nSpwzCwYvxBxUE8QRGu1X
	/BGZgCYNj439ruNYS/qipVyPTbA2OywvUyMJphzmcz0cRQ/o12+Ea0toNFvL1khNOUBmQz4uBufna
	BVLC6ExFpyuURHhwOJKinHskBeUP37/zCQwEOy8zbrs/pC/ebwXQHRHs/QGjdvKP7Ud9G7F5nZA5R
	54r8QJ5qA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k52w8-0002Fs-UG; Mon, 10 Aug 2020 08:13:40 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k52w3-0002EA-SG
 for linux-mediatek@lists.infradead.org; Mon, 10 Aug 2020 08:13:36 +0000
Received: by mail-il1-x12e.google.com with SMTP id z17so6826399ill.6
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2020 01:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8JVxd0LfquvEwFWlVzm0eoYFyTaACuRCRqytuLnTbGs=;
 b=a9sOniDgn+OX3mKLx8wyRn8G/5nz6p0EI+n+UIFh/JhVHrGaGWBfyBK8qTpZW46Zms
 hdRV6io4qZc/g8y8ufYqkof85s+/NTHPQKA02wTMCODPBydcjrwfgTE/IQWKIP+lzmSv
 wxHMVmyC+DZgK/X7uZx3FZSFhYr6wD7qgFNMt+R3KNmdSIRH7CU3OLWUrTVEpOW8Qme6
 myEN8Tpphf6T40JIWhx5Jm7DMOwy8WNGedfxBcBWj9iuiTzAD+M2nwzQN30h4V+LIOyv
 d4viMILdQO9wDAxaDrPZ9AcpRy9j3NTDK6hoVLQaNrijwaUe7Ex1jdY/o8+7qa8OzqVM
 eQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8JVxd0LfquvEwFWlVzm0eoYFyTaACuRCRqytuLnTbGs=;
 b=cI9NpgF9cDouR/adNVgje+7Wn9EJYpT7F51GEr5g+H+v6SCHTDZJXmAgLKn3tigxys
 E5vWXTiDIaOxJdeidlsZn+dnW9ksIJbyEqA0L3LHhQUcpOZq4TEZyt0Al48P5etDKo9A
 /PQzt7/opDGWlM9AVZ4cfuY0R4U7/WHjcDDtacSMDKa6Qu5wquu7qZedsRkQhkgmkHgj
 Yled68c7mSYHASzrm+sA8QG3Zitjky3BFTxP3FBj2rxBcNQxTF2zOadDCpJpDmnADMlh
 DH/7zSJAsewQgUNV5wBYirLKcV0R+RhnNHkhwiljLIvM68gsDI7SScDH2Zha6gOCYlz8
 OPqA==
X-Gm-Message-State: AOAM533x32QCutmjH0+IJlbtgqebBPb64ta6+AzGIfFnX4zd+eZ4KCw2
 yy/nMdJl7j02E3NmVFCkC6fG6/NBpvKT7FGquFymAA==
X-Google-Smtp-Source: ABdhPJysEFivEl0vYFplJC98GA9zeoDMNIxEa41sPvOq3HRZb2utcdXYgn2Zdo1CLZ1S13FPxCHpNSCIioXFwjPxw9I=
X-Received: by 2002:a05:6e02:1387:: with SMTP id
 d7mr16832113ilo.140.1597047211233; 
 Mon, 10 Aug 2020 01:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 10 Aug 2020 16:13:20 +0800
Message-ID: <CA+Px+wUkL7XwkppMA745cP_foNweaBLOSs0=BVzcDr0PEC+_Ew@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt6359: add codec driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_041335_952977_CCF9B900 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 10, 2020 at 11:11 AM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> Add the mt6359 codec driver.
>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

This patch also reviewed few rounds on https://crrev.com/c/2299951

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
