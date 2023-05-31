Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6114BC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 01:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGutzaRGzCaS2IM7OoVOY7Gnf34EmeNV+333thh2Qbg=; b=MeRJaSu8qd4t2BTbT8XykqZ5cg
	ohuYNwRylIM6XsolpdfBLKUUdisFHNMglsBO7YqOR8AxkPcYPM0FVALuayKo7ZZgOGHZelUNnOhoH
	3ysJsOKN/f/WD9VgluulfDebWQBU6uVOn1T4g05EJURq6i9uLpZLy5ZsHpVqkYX3MXCBVvssBJ71t
	QORkUjWZDozwHKkhod8powolbJxIxZ09z14JrMuEHpd72XTUww/K4P5ECX56HfPUJ90xfToNaTD58
	LWFi1R3pKHn7XbWqPBlvxPwgNJ34kAxBDCGJ1H81/XEFXoXb/F2beIGjm5W2NPqtT7pxsXJsWaLDZ
	7Ufai07w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4B2x-00FkdF-2R;
	Wed, 31 May 2023 01:54:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4B2u-00FkcC-0a;
	Wed, 31 May 2023 01:54:41 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f50a8f6dd7so2369428e87.2;
        Tue, 30 May 2023 18:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685498077; x=1688090077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGutzaRGzCaS2IM7OoVOY7Gnf34EmeNV+333thh2Qbg=;
        b=NFqrWeEEc2eZZmUflJd+XWmb4goNWaTDxLT8R8qzTtzgaacUQIpO3ugKO+/WPmENNy
         gNZfwCg2IJpDyyh5jI6m4wbvcz9xe4FJc9w0/FxRadzJ4XQtIW0m8lCt4Kjj6iEM50f+
         +Kb7KIOdBP5gGSrSGQpm1NotQnElhrAQr73D6o90Ru9WZ0r2KDS3hqh42ezCHy7fabtv
         Eb55zR5xTF81rSxvhMYhAsBgrme6aWduz2FUjZgn4MjfAYP+dSx7fG1z1W1uFtY7iRuV
         FF741ixTr7TPL6kjIxUXQpF2OdrYBwaSuAXkwlDcBeddaC6IKEn86w3gJb2z2g9O0Fz5
         bIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685498077; x=1688090077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGutzaRGzCaS2IM7OoVOY7Gnf34EmeNV+333thh2Qbg=;
        b=Gl9jBWtK4Fg589t7jDQyT5GgtGzDy1ikHbcjDDRsyAgsb7cK0+EMt9cGmBDrtPbKPr
         dr95ELmL7p36ln6HCmoUUmGV1DPiNA35Ny/GhU3bY/MbBYPtkUX0Vo57ygl5myJlbwvO
         O9WHA5LnXdOWYkUk+zrrqrbyap4PZMF4HDHLwH7HINUEFkujqOJ8H1LpAFs5m4R87sT/
         wcaSIJI1Nfd32m0NygLfkCTnqO1tQtPZCGUVK260h7Gvofxu+GF+jD9KOGj9XV+NWjXM
         K152fxhITHmjfFZ6jMTtK7eHHNNyV4r5q8OY9RdOXnQfidHUu9/J/hi2wq1H72Skz9If
         Vw4w==
X-Gm-Message-State: AC+VfDyhaxsfDVL2vu7cn9VSM/E0ulgLyiqJXwPtjI2s2xTJC7HzzLtG
	SM7BCfHIRz/gTqWyuTwOgAgQ7qn4W2kUa0KI2Q==
X-Google-Smtp-Source: ACHHUZ7aKybrqHQ2474lH0CxEJFIx5R1bltFR82B11NwwmzHHxdLa4pFC4VpurmwGhKT2emsk/xaHeRHUY0u7+Ota1g=
X-Received: by 2002:ac2:53b3:0:b0:4f4:d324:8b14 with SMTP id
 j19-20020ac253b3000000b004f4d3248b14mr1396549lfh.14.1685498077225; Tue, 30
 May 2023 18:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230530023227.16653-1-powen.kao@mediatek.com>
 <20230530023227.16653-2-powen.kao@mediatek.com> <1c182151-6e8c-5068-b38c-f8e842e6e13b@acm.org>
In-Reply-To: <1c182151-6e8c-5068-b38c-f8e842e6e13b@acm.org>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 31 May 2023 09:54:25 +0800
Message-ID: <CAGaU9a9TsoaUtoMX8cNmAhfBnCddRtWYEG8ACdRNJfri+sdasg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] scsi: ufs: core: Introduce mcq ops to config cqid
To: Bart Van Assche <bvanassche@acm.org>
Cc: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	peter.wang@mediatek.com, stanley.chu@mediatek.com, alice.chao@mediatek.com, 
	naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, cc.chou@mediatek.com, 
	eddie.huang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_185440_247375_2057CF5E 
X-CRM114-Status: GOOD (  13.67  )
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

On Wed, May 31, 2023 at 7:54=E2=80=AFAM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 5/29/23 19:32, Po-Wen Kao wrote:
> > MCQ sq/cq mapping is not just one for one, could many for one.
> > This patch allow host driver to change the mapping, assign cqid
> > for each hw queue.
>
> What use case do you have in mind for associating multiple submission
> queues with a single completion queue?
>

According to the specification or the original concept of MCQ, the
bindings between SQ and CQ can not be fixed to a single style.
In addition, some benchmark data shows that the performance can be
improved by using fewer CQs to aggregate the interrupt handling of
completion requests.
Therefore, we would like to introduce a vop to allow the host to
configure it accordingly.

Stanley

