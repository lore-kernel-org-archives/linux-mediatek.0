Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931E5C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 04:53:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3908D61413
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 04:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3908D61413
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Waj4t2MgrC7n/EXcbTuKdM5BG8YnKnXETv1Gx2hi0k=; b=h7FZw6YJ+ZzBc4
	EgD8bCbnYoWPnyOYcB1lpfG6w+lD9hfZA1HkSmXHaYO4JSjbRk4257zqtZySsz1lOFh200wvPdc22
	PyY+acLb8IyLHHuOqN2ErDMjhVeDd1BE1CoNYfhK+6GroLc2+GlADqBoD/QbUfYLnV5Sl51bHt/Um
	pW7piRGEe5OOfug6KvyowuC/k16XaTC0GokGnA2q0cklBtFtVyXbq0+oU6V6dLUSOlnzIiagUi97M
	ofL86rHLcQG9MYSt3q5w0CrRVb40zGY9BuMUdHxZ65FvI+u1OgponJ55aipoYB0JR5APTFSxsIrvE
	56bJ4Z7tuHpxlJRv2KNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzBAl-0026kK-LB; Fri, 02 Jul 2021 04:53:03 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzBAY-0026hk-Ns
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 04:52:51 +0000
Received: by mail-il1-x129.google.com with SMTP id o10so8611743ils.6
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 21:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OTnzHjgvCB7+prnqrgvMcjjG1MNUBAUB+vPqpckmDcQ=;
 b=rN5k2yEgnRx9zB2epWCUB+oEitM0fhGltBcekUy79X1JPOgF6S6GKplw7zuHtBtQWh
 hSWc6HaFoyYdgXwFiAWrXqAg/bSReCOcVWDgVIrBi9VA0fOQkhCbArxlXB+r1TncqExr
 yts6rr8EPA3L2uk8AIQoOVFQuTeb6MGPY/vMK1ewx3J9Ib9/WNBSzqhSNkjs0TF07Rov
 KDKMS5rUYExBpxgDD9R0i0p/7xXZSsWHMhQxYhFH1dECnSFE++hw2aJ7BpT7YdE2+gWt
 PxQw7GtftdOx0u74EhQY/XAiwu5Bz2lOyi66eoetaWw7pstB6dX5pzKZ5/9N9kkWpW2v
 VGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OTnzHjgvCB7+prnqrgvMcjjG1MNUBAUB+vPqpckmDcQ=;
 b=n8OtTBKVUSakpBjd0ZK+CMtkCJLod4n1niTe/MkdoB4QBQeJBOwL+ZKPOWmvdCRK9c
 0gz3QSB3RIUVyTaBGHWtO4jmAqwr/mIRq1ueqA8J76EcyVHlfJfdlYo4EjKNvzUSSWnU
 lyZ4WFUDLVM8+A6K6iO4Ty6X1+BrLa4WOshhza+y+ZGrXfFKEBwQ4VhIREytD1oldLAC
 rS9BcqdQ9TeFUc+Tbm08cD4aQ27SChEWCXC+vZ3Z6UmZJTdWoYecgwazA0hiBxaQSeL3
 NcANPhmIKU3ZsTNHhWkB7labnN8fUqWNwA4BRpWoZdfKNlzu4MV7uDz8qm/Uh91QFvoH
 4PbA==
X-Gm-Message-State: AOAM533zNGqtuVACYhBSRJ16dK34Pp9pSE8G0M3dZnJCPlpztshPc9PF
 lqcbJL9LDRhMq5LiecDmCx7FXHxCqOLS33F3EdZFHw==
X-Google-Smtp-Source: ABdhPJwhXP/ufyVIDmgCSp6rO2H9xUUw+CPophC6XtJ+N/YZdTspTb7mwnqiEnIGiTPbRNVfGEfuB4wHDIzK4cjbBy0=
X-Received: by 2002:a05:6e02:528:: with SMTP id
 h8mr2094954ils.127.1625201569685; 
 Thu, 01 Jul 2021 21:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210629094339.874120-1-fshao@chromium.org>
In-Reply-To: <20210629094339.874120-1-fshao@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 2 Jul 2021 12:52:38 +0800
Message-ID: <CA+Px+wW2Vi0=+E+oAE4--At5wapn15t+TVxZXdNR03-iNrruPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: mt6360: Sort regulator resources
To: Fei Shao <fshao@chromium.org>
Cc: lee.jones@linaro.org, Gene Chen <gene_chen@richtek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_215250_846183_8B6CF585 
X-CRM114-Status: UNSURE (   8.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 29, 2021 at 5:44 PM Fei Shao <fshao@chromium.org> wrote:
> Reorder the regulator resources.
Would be better to mention the list is sorted by their IRQ number.

> Fixes: 4ee06e10dd26 ("mfd: mt6360: Combine mt6360 pmic/ldo resources
> into mt6360 regulator resources")
It doesn't need to be a fixup for 4ee06e10dd26 but a follow up cleanup.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
