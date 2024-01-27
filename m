Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5E1C47422
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 01:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4asszGwiUMo7LHN03Rxc+ehZmU371TLpgrR3TOTZpw=; b=IAPQOq95z2AT6IRKhoiusEz22r
	8BxL6Hj0TZ8eyN4c4DdR2hcDyfX0VrSWgxe51yV8bznHxoaCIfynB/O8+umJvdqWXHxyCv7RIcBjz
	ICb50cSjbSfyKnMfOGjmrD8OXkVOTvzID7SLiENogN5kauyZwsJwB4rREsj29FiiYIkgHSPfkHWqr
	ilyP4/VVurKih8mpJQ+5WVMWa13ln6fR7DeYw93IlkhgnDKzGIeLU+zzCIqiFg4r0mZgBYmvAFsg2
	sXCvnF1MYLnBw16iqhgkX4qQnvg1KrLh3jWBVDMONY1XITTsC+hGHige/IU0I7eJ5a92R+HBQp7b9
	Cwi3+JDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTXiO-000000069A1-0jnN;
	Sat, 27 Jan 2024 01:42:36 +0000
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTXiL-0000000698f-1Znu;
	Sat, 27 Jan 2024 01:42:33 +0000
Message-ID: <c2b1e412-f1da-4e71-8ab9-e1a655c966e3@infradead.org>
Date: Fri, 26 Jan 2024 17:42:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] media: videodev2.h: Fix kerneldoc
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin Liu <bin.liu@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-amlogic@lists.infradead.org
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-2-eed7865fce18@chromium.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-2-eed7865fce18@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/26/24 15:16, Ricardo Ribalda wrote:
> Named nested unions need their prefix:
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#nested-structs-unions
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/uapi/linux/videodev2.h | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 68e7ac178cc2..a8015e5e7fa4 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1041,13 +1041,13 @@ struct v4l2_requestbuffers {
>   * struct v4l2_plane - plane info for multi-planar buffers
>   * @bytesused:		number of bytes occupied by data in the plane (payload)
>   * @length:		size of this plane (NOT the payload) in bytes
> - * @mem_offset:		when memory in the associated struct v4l2_buffer is
> + * @m.mem_offset:	when memory in the associated struct v4l2_buffer is
>   *			V4L2_MEMORY_MMAP, equals the offset from the start of
>   *			the device memory for this plane (or is a "cookie" that
>   *			should be passed to mmap() called on the video node)
> - * @userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer
> + * @m.userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer
>   *			pointing to this plane
> - * @fd:			when memory is V4L2_MEMORY_DMABUF, a userspace file
> + * @m.fd:		when memory is V4L2_MEMORY_DMABUF, a userspace file
>   *			descriptor associated with this plane
>   * @m:			union of @mem_offset, @userptr and @fd
>   * @data_offset:	offset in the plane to the start of data; usually 0,
> @@ -1085,14 +1085,14 @@ struct v4l2_plane {
>   * @sequence:	sequence count of this frame
>   * @memory:	enum v4l2_memory; the method, in which the actual video data is
>   *		passed
> - * @offset:	for non-multiplanar buffers with memory == V4L2_MEMORY_MMAP;
> + * @m.offset:	for non-multiplanar buffers with memory == V4L2_MEMORY_MMAP;
>   *		offset from the start of the device memory for this plane,
>   *		(or a "cookie" that should be passed to mmap() as offset)
> - * @userptr:	for non-multiplanar buffers with memory == V4L2_MEMORY_USERPTR;
> + * @m.userptr:	for non-multiplanar buffers with memory == V4L2_MEMORY_USERPTR;
>   *		a userspace pointer pointing to this buffer
> - * @fd:		for non-multiplanar buffers with memory == V4L2_MEMORY_DMABUF;
> + * @m.fd:		for non-multiplanar buffers with memory == V4L2_MEMORY_DMABUF;
>   *		a userspace file descriptor associated with this buffer
> - * @planes:	for multiplanar buffers; userspace pointer to the array of plane
> + * @m.planes:	for multiplanar buffers; userspace pointer to the array of plane
>   *		info structs for this buffer
>   * @m:		union of @offset, @userptr, @planes and @fd
>   * @length:	size in bytes of the buffer (NOT its payload) for single-plane
> @@ -2423,15 +2423,15 @@ struct v4l2_meta_format {
>  
>  /**
>   * struct v4l2_format - stream data format
> - * @type:	enum v4l2_buf_type; type of the data stream
> - * @pix:	definition of an image format
> - * @pix_mp:	definition of a multiplanar image format
> - * @win:	definition of an overlaid image
> - * @vbi:	raw VBI capture or output parameters
> - * @sliced:	sliced VBI capture or output parameters
> - * @raw_data:	placeholder for future extensions and custom formats
> - * @fmt:	union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
> - *		and @raw_data
> + * @type:		enum v4l2_buf_type; type of the data stream
> + * @fmt.pix:		definition of an image format
> + * @fmt.pix_mp:		definition of a multiplanar image format
> + * @fmt.win:		definition of an overlaid image
> + * @fmt.vbi:		raw VBI capture or output parameters
> + * @fmt.sliced:		sliced VBI capture or output parameters
> + * @fmt.raw_data:	placeholder for future extensions and custom formats
> + * @fmt:		union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr,
> + *			@meta and @raw_data
>   */
>  struct v4l2_format {
>  	__u32	 type;
> 

-- 
#Randy

