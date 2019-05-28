From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFCv1 00/12] media: mtk-vcodec: support for MT8183 decoder
Date: Tue, 28 May 2019 11:18:29 +0200
Message-ID: <f143b2e2-45ab-9d59-a607-f2032206e4e0@xs4all.nl>
References: <20190528055635.12109-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 5/28/19 7:56 AM, Alexandre Courbot wrote:
> This series is a refactoring/split of the initial patch for MT8183 codec support
> that was posted for Chrome OS [1] in order to make it upstreamable.
> 
> The line count has been significantly reduced compared to the initial patch,
> although support for the MT8183 encoder is not here yet to limit the amount of
> code to review.
> 
> Although the series applies on top of today's media tree, it will not compile
> until support for the SCP is merged, hence the RFC status. Note also that the
> H.264 structures used and implementation of the stateless codec API may not be
> completely up-to-date. So the goal of this publication is to review the general
> idea (especially split unto stateful and stateless ops), and maybe merge the
> first 5 patches.
> 
> Patches 1-5 are cleanup/small fixes that came while working on this series. They
> should be harmless and can be merged.

Merging these makes sense. I should be able to do that when v2 is posted with the
SPDX conversion.

Regards,

	Hans
