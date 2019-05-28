From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFCv1 07/12] media: mtk-vcodec: abstract firmware interface
Date: Tue, 28 May 2019 11:16:11 +0200
Message-ID: <b4320740-a016-4a0e-b9ae-e042fd305b12@xs4all.nl>
References: <20190528055635.12109-1-acourbot@chromium.org>
 <20190528055635.12109-8-acourbot@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528055635.12109-8-acourbot@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 5/28/19 7:56 AM, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> MT8183's codec firwmare is run by a different remote processor from
> MT8173. While the firmware interface is basically the same, the way to
> invoke it differs. Abstract all firmware calls under a layer that will
> allow us to handle both firmware types transparently.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> [acourbot: refactor, cleanup and split]

High-level question: is the mt8183 firmware different from the MT8173?
And if so, is or will that firmware be part of linux-firmware?

Regards,

	Hans
