From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [RFC PATCH 1/6] drm: Add Content Protection property
Date: Thu, 7 Dec 2017 14:30:52 +0000
Message-ID: <20171207143052.533e1e94@alans-desktop>
References: <20171130030907.26848-1-seanpaul@chromium.org>
 <20171130030907.26848-2-seanpaul@chromium.org>
 <20171205102840.GB12982@amd>
 <20171205104538.b4fxdjad3c46koas@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171205104538.b4fxdjad3c46koas@phenom.ffwll.local>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

> If you want to actually lock down a machine to implement content
> protection, then you need secure boot without unlockable boot-loader and a
> pile more bits in userspace. 

So let me take my Intel hat off for a moment.

The upstream policy has always been that we don't merge things which
don't have an open usable user space. Is the HDCP encryption feature
useful on its own ? What do users get from it ?

If this is just an enabler for a lump of binary stuff in ChromeOS then I
don't think it belongs, if it is useful standalone then it seems it does
belong ?

Alan
