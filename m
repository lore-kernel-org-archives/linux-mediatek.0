From: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [RFCv1 07/12] media: mtk-vcodec: abstract firmware interface
Date: Tue, 4 Jun 2019 16:53:47 +0900
Message-ID: <CAPBb6MUTG3Pe6pU=gD0m0N3mOOHGyEp5Je58s3ahH_83a4i1rg@mail.gmail.com>
References: <20190528055635.12109-1-acourbot@chromium.org> <20190528055635.12109-8-acourbot@chromium.org>
 <b4320740-a016-4a0e-b9ae-e042fd305b12@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b4320740-a016-4a0e-b9ae-e042fd305b12@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, May 28, 2019 at 6:16 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 5/28/19 7:56 AM, Alexandre Courbot wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > MT8183's codec firwmare is run by a different remote processor from
> > MT8173. While the firmware interface is basically the same, the way to
> > invoke it differs. Abstract all firmware calls under a layer that will
> > allow us to handle both firmware types transparently.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > [acourbot: refactor, cleanup and split]
>
> High-level question: is the mt8183 firmware different from the MT8173?
> And if so, is or will that firmware be part of linux-firmware?

Yes, the firmware is different, and AFAICT it will be posted to linux-firmware.
