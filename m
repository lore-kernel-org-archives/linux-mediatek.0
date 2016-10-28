From: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Subject: Re: [PATCH next 1/2] media: mtk-mdp: fix video_device_release
 argument
Date: Fri, 28 Oct 2016 09:52:54 +0200
Message-ID: <20161028075253.gdy2bbugih6oqncw@romuald.bergerie>
References: <1473340146-6598-4-git-send-email-minghsiu.tsai@mediatek.com>
 <20161027202325.20680-1-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161027202325.20680-1-vincent.stehle@laposte.net>
Sender: linux-media-owner@vger.kernel.org
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Oct 27, 2016 at 10:23:24PM +0200, Vincent Stehlé wrote:
> video_device_release() takes a pointer to struct video_device as argument.
> Fix two call sites where the address of the pointer is passed instead.

Sorry, I messed up: please ignore that "fix". The 0day robot made me
realize this is indeed not a proper fix.

The issue remains, though: we cannot call video_device_release() on the
vdev structure member, as this will in turn call kfree(). Most probably,
vdev needs to be dynamically allocated, or the call to
video_device_release() dropped completely.

Sorry for the bad patch.

Best regards,

Vincent.
